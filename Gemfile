source "https://rubygems.org"




gem "rails", "~> 4.1.1"




gem "exception_notification", "~> 4.1.0.rc1"
gem "foundation-rails", "~> 5.2.3.0"
gem "jquery-rails", "~> 3.1.0"
gem "meta-tags", "~> 2.0.0"
gem "roman-numerals", "~> 0.3.0"
gem "sass-rails", "~> 4.0.3"
gem "settingslogic", "~> 2.0.9"
gem "turbolinks", "~> 2.2.2"
gem "uglifier", "~> 2.5.0"

# Stragglers
gem "hike", "~> 1.2"								# sass-rails (~> 4.0.3) ruby depends on sprockets (<= 2.11.0, ~> 2.8) ruby depends on hike (~> 1.2) ruby
gem "mail", "~> 2.5.4"							# rails (~> 4.1.1) ruby depends on actionmailer (= 4.1.1) ruby depends on mail (~> 2.5.4) ruby
gem "mime-types", "~> 1.16"					# mail (~> 2.5.4) ruby depends on mime-types (~> 1.16) ruby
gem "sass", "~> 3.2.0"							# sass-rails (~> 4.0.3) ruby depends on sass (~> 3.2.0) ruby
gem "sprockets", "~> 2.8"						# sass-rails (~> 4.0.3) ruby depends on sprockets (<= 2.11.0, ~> 2.8) ruby
gem "tilt", "~> 1.1"								# sass-rails (~> 4.0.3) ruby depends on sprockets (<= 2.11.0, ~> 2.8) ruby depends on tilt (!= 1.3.0, ~> 1.1) ruby
gem "timers", "~> 1.1.0"						# guard-bundler (~> 2.0.0) ruby depends on guard (~> 2.2) ruby depends on listen (~> 2.1) ruby depends on celluloid (>= 0.15.2) ruby depends on timers (~> 1.1.0) ruby
gem "treetop", "~> 1.4.8"						# mail (~> 2.5.4) ruby depends on treetop (~> 1.4.8) ruby









group :test, :development do
	gem "debugger", "~> 1.6.8"
	gem "guard-bundler", "~> 2.0.0"
	gem "guard-rspec", "~> 4.2.9"
	gem "rspec-rails", "~> 3.0.1"
	gem "spring-commands-rspec", "~> 1.0.2"
	gem "sqlite3", "~> 1.3.9"
end









group :test do
end









group :development do
	gem "capistrano-rails", "~> 1.1"
	gem "letter_opener", "~> 1.2.0"
	gem "rvm1-capistrano3", "~> 1.2.2", require: false
end









group :production do
	gem "mysql2", "~> 0.3.16"
end
