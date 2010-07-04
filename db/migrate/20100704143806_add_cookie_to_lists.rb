class AddCookieToLists < ActiveRecord::Migration
  def self.up
    add_column :lists, :cookie, :string
  end

  def self.down
    remove_column :lists, :cookie
  end
end
