class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :title
      t.string :link_url
      t.string :edit_url

      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
