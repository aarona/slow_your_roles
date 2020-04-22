# frozen_string_literal: true

module SlowYourRoles
  module Generators
    # Generator class to add SlowYourRoles to an ActiveRecord model.
    class SlowYourRolesGenerator < Rails::Generators::Base
      namespace 'slow_your_roles'

      argument :role_col, type: :string, required: false, default: 'roles', banner: 'role column'

      class_option :use_bitmask_method, type: :boolean, required: false, default: false,
                                        desc: 'Setup migration for Bitmask method'

      desc 'Create ActiveRecord migration for slow_your_roles on NAME model using \
[ROLE] column -- defaults to \'roles\''

      source_root File.expand_path('../templates', __dir__)

      hook_for :orm

      def show_readme
        readme 'README' if behavior == :invoke
      end
    end
  end
end
