# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'rubygems'
require 'magic_multi_connections'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.test? 

else
	connection_names = ["development", "stsc_feedzilla_downloader"]
	@@connection_pool = connection_names.map do |connection_name|
  		Object.class_eval <<-EOS
    		module #{connection_name.camelize}
      		establish_connection :#{connection_name}
    		end
  		EOS
  		connection_name.camelize.constantize
	end
end
