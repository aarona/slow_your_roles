# frozen_string_literal: true

require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('slow_your_roles', '2.0.1') do |p|
  p.description    = 'Easy role authorization in rails'
  p.url            = 'http://github.com/aarona/slow_your_roles'
  p.author         = 'Aaron A'
  p.email          = '_aaron@tutanota.com'
  p.ignore_pattern = ['tmp/*', 'script/*']
  p.dependencies   = ['activesupport']
  p.development_dependencies = %w[rspec activerecord rubocop sqlite3]
end
