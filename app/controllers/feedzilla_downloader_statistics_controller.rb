class FeedzillaDownloaderStatisticsController < ApplicationController
  
  def index
	@executions = FeedzillaDownloaderStatistic.group(:start_date,:process_id).order(:start_date)
  end

  def view
	@process_id = params[:process_id]
	@statistics = FeedzillaDownloaderStatistic.find_all_by_process_id(@process_id).order(:start_date)
  end

end
