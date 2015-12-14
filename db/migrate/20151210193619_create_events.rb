class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :info
      t.datetime :event_start
      t.datetime :event_end

      t.timestamps
    end
  end
end
