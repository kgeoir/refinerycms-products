# -*- coding: utf-8 -*-
class CreateProductCategories < ActiveRecord::Migration
  def up
    create_table :refinery_product_categories do |t|
      # Category name
      t.string  :name,        :null => false, :limit => 50
      # Classification Number SKU
      t.string  :code,        :null => false, :limit => 50
      # A brief description
      t.string  :description, :default => '', :limit => 200
      # Parent category ID
      t.integer :parent_id
      # The ID of the collection of all subtrees, separated by commas
      t.string  :subtree_ids, :default => '', :limit => 100
      # Sequence (Ascending)
      t.integer :sort,        :default => 0

      # Image
      t.string   :image_mime_type
      t.string   :image_name
      t.integer  :image_size
      t.integer  :image_width
      t.integer  :image_height
      t.string   :image_uid
      t.string   :image_ext

      t.timestamps
    end
  end

  def down
    drop_table :refinery_product_categories
  end
end
