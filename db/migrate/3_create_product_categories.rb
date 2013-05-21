# -*- coding: utf-8 -*-
class CreateProductCategories < ActiveRecord::Migration
  def up
    create_table :refinery_product_categories do |t|
      # 分类名称 => Category name
      t.string  :name,        :null => false, :limit => 50
      # 分类编号 => Classification Number
      t.string  :code,        :null => false, :limit => 50
      # 简短描述 => A brief description
      t.string  :description, :default => '', :limit => 200
      # 父分类ID => Parent category ID
      t.integer :parent_id
      # 所有子树的ID集合,以逗号分隔 => The ID of the collection of all subtrees, separated by commas
      t.string  :subtree_ids, :default => '', :limit => 100
      # 分类类型(单表继承所用) => Classification type (Single Table Inheritance)
      # t.string  :type,        :null => false, :limit => 50
      # 排序(升序排列) => Sequence (Ascending)
      t.integer :sort,        :default => 0

      t.timestamps
    end
  end

  def down
    drop_table :refinery_product_categories
  end
end
