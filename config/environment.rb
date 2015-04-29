# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'magic_multi_connections'

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.test? 
	module StscFeedzillaDownloader
		establish_connection :stsc_feedzilla_downloader_test
	end
else
	module StscFeedzillaDownloader
		establish_connection :stsc_feedzilla_downloader_development
	end
end

