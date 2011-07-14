# Rename

Renaming your app in Rails3 is no longer a hassle. 
This plugin allows you to rename your Ruby on Rails 3 app seamlessly with a single command.

## Installation

	% rails plugin install git@github.com:get/Rename.git

## Usage

Manually rename your main project directory to SweetNewName and run:

	% rails g rename_to SweetNewName

That will rename your app in the following files:

	config/application.rb
	config/environment.rb
	config/environments/development.rb
	config/environments/test.rb
	config/environments/production.rb
	config/routes.rb
	config.ru
	config/initializers/secret_token.rb
	config/initializers/session_store.rb

## Uninstall

Remove the plugin directory manually or simply:

	rm -r "vendor/plugins/Rename"
