class FeedzillaDownloaderStatistic < ActiveRecord::Base
	establish_connection DB_CONFIG["stsc_feedzilla_downloader"]
	self.table_name = "datafeed_statistics"
	
end
