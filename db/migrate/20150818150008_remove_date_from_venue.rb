class RemoveDateFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :date, :string
  end
end
