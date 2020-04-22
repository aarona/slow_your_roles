# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'slow_your_roles'
  s.version = '2.0.1'
  s.authors = ['Aaron A']
  s.date = '2020-04-21'
  s.summary = 'Easy role authorization in Rails'
  s.description = 'Easy role authorization in Rails ported from an unmaintained library'
  s.email = '_aaron@tutanota.com'
  s.extra_rdoc_files = ['CHANGELOG.md', 'README.md'] + Dir['lib/**/*']
  s.files = [
    'CHANGELOG.md',
    'Gemfile',
    'Gemfile.lock',
    'README.md',
    'Rakefile',
    'slow_your_roles.gemspec',
    'init.rb'] + Dir['lib/**/*']
  s.test_files = Dir['spec/**/*']
  s.homepage = 'http://github.com/aarona/slow_your_roles'
  s.rdoc_options = [
    '--line-numbers',
    '--inline-source',
    '--title',
    'Slow_your_roles',
    '--main',
    'README.md'
  ]
  s.require_paths = ['lib']
  s.add_runtime_dependency('activesupport', ['>= 0'])
  s.add_development_dependency('activerecord', ['>= 0'])
  s.add_development_dependency('rspec', ['>= 0'])
  s.add_development_dependency('rubocop', ['>= 0'])
  s.add_development_dependency('sqlite3', ['>= 0'])
end
