namespace :db do

  desc "Create Yahoo downloader"
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

end
