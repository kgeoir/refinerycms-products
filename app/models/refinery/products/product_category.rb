# -*- coding: utf-8 -*-
require 'dragonfly'
require 'acts_as_indexed'

module Refinery
  module Products
    class ProductCategory < Refinery::Core::BaseModel
      ::Refinery::Products::Dragonfly.setup!

      self.table_name = 'refinery_product_categories'

      belongs_to :parent, :class_name => name
      has_many :children, :class_name => name, :foreign_key => "parent_id", :dependent => :destroy

      include Images::Validators

      image_accessor :image
      attr_accessible :name, :code, :description, :parent_id, :image, :image_size


      scope :roots, :conditions => 'parent_id is NULL', :order => 'sort ASC, created_at DESC'

      after_create :initial_subtree_ids
      before_validation :update_subtree_ids
      after_save :update_ancestors_subtree_ids
      after_destroy :update_ancestors_subtree_ids

      validates_presence_of :name, :code
      validates_uniqueness_of :code
      validate :paternity

      def ancestors nodes = []
        node = self
        if node.parent.nil?
          return nodes
        else
          nodes << self.parent
          return node.parent.ancestors(nodes)
        end
      end

      def products
        Product.where(category_id: self.id)
      end

    private

      def paternity
        if !self.id.nil? && self.parent_id == self.id
          errors.add(:parent_id, "can not be equal to object id: you can't be your own father! that's sick!!!")
        end
      end

      # 初始化DN, 原理是调用save触发更新时的update_dn生成DN然后保存
      # => Initialization DN principle the call save trigger updates
      # update_dn generated DN and then save
      def initial_subtree_ids
	      self.save
      end

      def update_subtree_ids
        self.subtree_ids = get_subtree_ids(self).concat([self.id]).join(',')
      end

      def update_ancestors_subtree_ids
        self.ancestors.each { |ancestor| ancestor.save } if self.ancestors
      end

      def get_subtree_ids node
        ids = []

        if node and node.children
          node.children.each do |cate|
            ids << cate.id
            ids.concat(get_subtree_ids(cate)) if cate.children
          end
        end

        return ids
      end

    end
  end
end
