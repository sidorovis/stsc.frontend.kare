class CreateDatafeedSettingsForTest < ActiveRecord::Migration
  def change
	if Rails.env.test?
    	create_table :datafeed_settings do |t|
    	end
	end
  end
end
