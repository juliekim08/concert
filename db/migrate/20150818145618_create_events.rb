class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :venue_id
      t.string :date
      t.string :show

      t.timestamps null: false
    end
  end
end


