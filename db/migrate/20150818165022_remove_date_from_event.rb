class RemoveDateFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :date, :string
  end
end
