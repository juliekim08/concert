class RemoveNokogiriObjectFromVenue < ActiveRecord::Migration
  def change
    remove_column :venues, :nokogiri_object, :string
  end
end
