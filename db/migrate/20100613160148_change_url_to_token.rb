class ChangeUrlToToken < ActiveRecord::Migration
  def self.up
      rename_column :lists, :edit_url, :edit_token
      rename_column :lists, :link_url, :link_token
  end

  def self.down
      rename_column :lists, :edit_token, :edit_url
      rename_column :lists, :link_token, :link_url
  end
end
