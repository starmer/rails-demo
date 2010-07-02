class ChangeOrderToPositionOnItems < ActiveRecord::Migration
  def self.up
    rename_column :items, :order, :position
  end

  def self.down
    rename_column :items, :postion, :order
  end
end
