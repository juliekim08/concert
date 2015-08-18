class RemoveShowFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :show, :string
  end
end
