# = Migration for the is_taggable plugin
# 
class CreateTaggables < ActiveRecord::Migration
  def self.up

    create_table :tags do |t|
      t.string :name, :default => ''
      t.string :kind, :default => ''
      t.timestamps
    end

    create_table :taggings do |t|
      t.integer :tag_id
      # Interface +taggable+
      t.string  :taggable_type
      t.integer :taggable_id
      t.timestamps
    end

    # Add indices
    add_index :tags, :name
    add_index :tags, [:name, :kind], :name => "name_and_kind"
    add_index :taggings, [:taggable_type, :taggable_id], :name => "taggable_interface_index"

  end

  def self.down
    drop_table :tags
    drop_table :taggings
  end
end
