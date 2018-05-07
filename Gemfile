source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.1'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'therubyracer'
gem 'execjs'
gem 'twitter-bootstrap-rails'
gem 'font-awesome-rails'
gem 'seed-fu'
gem 'slim-rails'
gem 'roo', '~> 2.4.0'
gem 'axlsx'
gem 'zip-zip'
gem 'rubyzip', '=1.1.0'
gem 'axlsx_rails'
gem 'vuejs-rails'
gem 'momentjs-rails'
gem 'erubis'
gem 'simple_form'
gem 'rails_admin'
gem 'rails_admin-i18n'
gem 'i18n_generators'
gem 'inum'
gem 'inum_types', git: 'https://github.com/tamura2004/inum_types.git'

group :development, :test do
  gem 'spring-commands-rspec'
  gem 'annotate'
  gem 'rubocop'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
end

# gem 'wicked_pdf'
# gem 'wkhtmltopdf-binary'
gem "prawn"
gem "prawn-table"