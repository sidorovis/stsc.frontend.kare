class FeedzillaDownloaderStatisticsController < ApplicationController
  def index
	@downloader_statistics = FeedzillaDownloaderStatistic.last(50)
  end
end
