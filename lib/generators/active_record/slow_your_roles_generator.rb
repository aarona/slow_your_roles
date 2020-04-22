# frozen_string_literal: true

require 'rails/generators/active_record'
require_relative '../install_generator_helpers'

module ActiveRecord
  module Generators
    # Generator class to add SlowYourRoles to an ActiveRecord model.
    class SlowYourRolesGenerator < ActiveRecord::Generators::Base
      include SlowYourRoles::InstallGeneratorHelpers

      argument :role_col, type: :string, required: false, default: 'roles', banner: 'role column'

      class_option :use_bitmask_method, type: :boolean, required: false, default: false,
                                        desc: 'Setup migration for Bitmask method'

      class_option :add_index, type: :boolean, required: false, default: false,
                               desc: 'Add an index to the relevant column'

      desc 'Internal use by slow_your_roles generator - use that instead'

      source_root File.expand_path('templates', __dir__)

      def create_user_model
        fname = "app/models/#{table_name.singularize.underscore}.rb"

        if File.exist?(File.join(destination_root, fname))
          inclusion = "slow_your_roles :#{role_col}"
          if parse_file_for_line(fname, inclusion)
            say_status('skipped', fname)
          else
            after = "class #{table_name.singularize.camelize} < ApplicationRecord\n"
            inject_into_file fname, after: after do
              <<-HEREDOC
  #{inclusion}
              HEREDOC
            end
          end
        else
          template('model.rb.erb', fname)
        end
      end

      def copy_slow_your_roles_migration
        if options.use_bitmask_method
          migration_template 'migration_bitmask.rb.erb',
                             "db/migrate/add_roles_to_#{table_name}.rb"
        else
          migration_template 'migration_serialize.rb.erb',
                             "db/migrate/add_roles_to_#{table_name}.rb"
        end
      end
    end
  end
end
