require File.expand_path('../lib/dm-serializer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ['Guy van den Berg', 'Dan Kubb']
  gem.email       = ['dan.kubb@gmail.com']
  gem.summary     = 'DataMapper plugin for serializing Resources and Collections'
  gem.description = 'dm-serializer allows DataMapper models and collections to be serialized to a variety of formats ' \
                    '(currently JSON, XML, YAML and CSV)'
  gem.license = 'Nonstandard'
  gem.homepage = 'https://datamapper.org'

  gem.files            = `git ls-files`.split("\n")
  gem.extra_rdoc_files = %w(LICENSE README.rdoc)

  gem.name          = 'sbf-dm-serializer'
  gem.require_paths = ['lib']
  gem.version       = DataMapper::Serializer::VERSION
  gem.required_ruby_version = '>= 2.7'

  gem.add_runtime_dependency('sbf-dm-core',    '~> 1.3.0.beta')
  gem.add_runtime_dependency('fastercsv',  '~> 1.5.4')
  gem.add_runtime_dependency('multi_json', '~> 1.3.2')
  gem.add_runtime_dependency('rexml', '~> 3.2')
end
