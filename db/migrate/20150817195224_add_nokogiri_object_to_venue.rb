class AddNokogiriObjectToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :nokogiri_object, :string
  end
end
