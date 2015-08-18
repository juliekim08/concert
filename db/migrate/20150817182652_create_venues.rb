class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :date
      t.string :place

      t.timestamps null: false
    end
  end
end
