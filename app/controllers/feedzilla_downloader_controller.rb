class FeedzillaDownloaderController < ApplicationController
  def index
	@data = StscFeedzillaDownloader::FeedzillaDownloaderStatistics.all
  end
end
