class AddShowToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :show, :string
  end
end
