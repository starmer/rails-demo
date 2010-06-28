class LinkItemToList < ActiveRecord::Migration
  def self.up
    add_column :items, :list_id, :integer
  end

  def self.down
    remove_column :items, :list_id
  end
end
