class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.boolean :archived
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
