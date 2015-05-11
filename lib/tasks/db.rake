namespace :db do

  desc "Create All External Databases"
  task create_external: :environment do
     Rake::Task["db:create_yahoo_downloader"].invoke
     Rake::Task["db:create_feedzilla_downloader"].invoke
  end

  desc "Create Yahoo Downloader Database"
  task create_yahoo_downloader: :environment do
    ExternalBase::Creator::create_database(DB_CONFIG["stsc_yahoo_downloader"])
  end

  desc "Create Feedzilla Downloader Database"
  task create_feedzilla_downloader: :environment do
    ExternalBase::Creator::create_database(DB_CONFIG["stsc_feedzilla_downloader"])
  end

  desc "Migrate All External Databases"
  task migrate_external: :environment do
     Rake::Task["db:migrate_yahoo_downloader"].invoke
     Rake::Task["db:migrate_feedzilla_downloader"].invoke
  end

  desc "Migrate Yahoo Downloader Databases"
  task migrate_yahoo_downloader: :environment do
    if (Rails.env.production?)
        puts "Rake Task defined only for development or test environment"
    else
        ActiveRecord::Base.establish_connection DB_CONFIG["stsc_yahoo_downloader"]
        ActiveRecord::Migrator.migrate("db/migrate/stsc_yahoo_downloader")
    end
  end

  desc "Migrate Feedzilla Downloader Databases"
  task migrate_feedzilla_downloader: :environment do
    if (Rails.env.production?)
        puts "Rake Task defined only for development or test environment"
    else
        ActiveRecord::Base.establish_connection DB_CONFIG["stsc_feedzilla_downloader"]
        ActiveRecord::Migrator.migrate("db/migrate/stsc_feedzilla_downloader")
    end
  end


end
