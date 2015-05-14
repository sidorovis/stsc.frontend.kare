class AddDatafeedStatistics < ActiveRecord::Migration
  def change
    create_table :datafeed_statistics do |t|
        t.string :setting_name
        t.date :start_date
        t.integer :process_id
        t.string :statistic_type
        t.string :message
        t.date :created_at
    end
  end
  def down
    drop_table :datafeed_statistics
  end
end
