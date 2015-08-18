class RemovePlaceFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :place, :string
  end
end
