source "https://rubygems.org"




gem "rails", "~> 4.0.2"




#gem "bcrypt-ruby", "~> 3.1.2" # Use ActiveModel has_secure_password
#gem "cancan"
#gem "delayed_job_active_record"
#gem "nested_form"
#gem "paper_trail"
#gem "state_machine"
gem "coffee-rails"#, "~> 4.0.0"
gem "foundation-rails"
gem "jbuilder"#, "~> 1.2"
gem "jquery-rails"
gem "meta-tags", require: "meta_tags"
gem "sass-rails"#, "~> 4.0.0"
gem "settingslogic"
gem "turbolinks"
gem "uglifier"#, ">= 1.3.0"




group :test, :development do
	# gem "debugger", group: [:development, :test]
  #gem "rb-inotify"
  gem "rspec-rails"
  gem "sqlite3"
end

group :development do
	gem "capistrano"
	gem "letter_opener"
	gem "rvm1-capistrano3", require: false
end

group :test do
  #gem "rack_session_access"
  gem "capybara"
  gem "factory_girl_rails"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spork"
  gem "launchy" # Ref: http://techiferous.com/2010/04/using-capybara-in-rails-3/ for save_and_open_page to work
  gem "spork-rails"
end

group :production do
  gem "exception_notification"
  gem "mysql2"
end

#group :doc do
#  # bundle exec rake doc:rails generates the API under doc/api.
#  gem "sdoc", require: false
#end
