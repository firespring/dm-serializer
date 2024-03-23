require 'pathname'

source 'https://rubygems.org'

gemspec

DM_VERSION     = '~> 1.3.0.beta'.freeze
DO_VERSION     = '~> 0.10.6'.freeze
DM_DO_ADAPTERS = %w(sqlite postgres mysql oracle sqlserver).freeze
CURRENT_BRANCH = ENV.fetch('GIT_BRANCH', 'master')

gem 'dm-core', DM_VERSION, git: "firespring/dm-core", branch: CURRENT_BRANCH

gem 'fastercsv',  '~> 1.5.4'
gem 'json',       '~> 1.5.4', platforms: %i(ruby_18 jruby)
gem 'json_pure',  '~> 1.5.4', platforms: [:mswin]
gem 'multi_json'

group :development do
  gem 'dm-validations', DM_VERSION, git: "firespring/dm-validations", :branch => CURRENT_BRANCH
  gem 'rake'
  gem 'rspec'
end

group :testing do
  gem 'libxml-ruby', '~> 2.2.2', platforms: %i(mri mswin)
  gem 'nokogiri',    '~> 1.4.4'
end

platforms :mri_18 do
  group :quality do

    gem 'rcov'
    gem 'yard'
    gem 'yardstick'

  end
end

group :datamapper do

  adapters = ENV['ADAPTER'] || ENV.fetch('ADAPTERS', nil)
  adapters = adapters.to_s.tr(',', ' ').split.uniq - %w(in_memory)

  if (do_adapters = DM_DO_ADAPTERS & adapters).any?
    do_options = {}
    do_options[:git] = "firespring/datamapper-do" if ENV['DO_GIT'] == 'true'

    gem 'data_objects', DO_VERSION, do_options.dup

    do_adapters.each do |adapter|
      adapter = 'sqlite3' if adapter == 'sqlite'
      gem "do_#{adapter}", DO_VERSION, do_options.dup
    end

    gem 'dm-do-adapter', DM_VERSION, git: "firespring/dm-do-adapter", branch: CURRENT_BRANCH
  end

  adapters.each do |adapter|
    gem "dm-#{adapter}-adapter", DM_VERSION, git: "firespring/dm-#{adapter}-adapter", branch: CURRENT_BRANCH
  end

  plugins = ENV['PLUGINS'] || ENV.fetch('PLUGIN', nil)
  plugins = plugins.to_s.tr(',', ' ').split.push('dm-migrations').uniq

  plugins.each do |plugin|
    gem plugin, DM_VERSION, git: "firespring/#{plugin}", branch: CURRENT_BRANCH
  end
end
