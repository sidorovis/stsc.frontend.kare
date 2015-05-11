require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

db_conf = YAML::load(File.open(File.join("./",'config','database.yml')))

DB_CONFIG = {}
DB_CONFIG["stsc_feedzilla_downloader"] = db_conf["stsc_feedzilla_downloader"][Rails.env.to_str]
DB_CONFIG["stsc_yahoo_downloader"] = db_conf["stsc_yahoo_downloader"][Rails.env.to_str]

module ExternalBase
  class ExternalStscDatabaseTasks
      include ActiveRecord::Tasks::DatabaseTasks
  end
  class Creator
    def self.create_database(config)
        if (Rails.env.production?)
          puts "Rake Task defined only not for production environment"
        else
            a = ExternalStscDatabaseTasks.new
            a.register_task(/mysql/,        ActiveRecord::Tasks::MySQLDatabaseTasks)
            a.register_task(/postgresql/,   ActiveRecord::Tasks::PostgreSQLDatabaseTasks)
            a.register_task(/sqlite/,       ActiveRecord::Tasks::SQLiteDatabaseTasks)
            a.create(config)
        end
    end
  end
end

module StscFrontendKare
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
