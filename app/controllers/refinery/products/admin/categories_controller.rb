require 'will_paginate/array'

module Refinery
  module Products
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify "refinery/products/product_category", :xhr_paging => true

        before_filter do @categories = Products::ProductCategory.all end

        def index
          @categories = Products::ProductCategory.roots.paginate(:page => 1)
        end

        def edit
          @category = Products::ProductCategory.find_by_id(params[:id])
        end

        def new
          @category = Products::ProductCategory.new
        end

        def update
          @category = Products::ProductCategory.find_by_id params[:id]

          if !params[:product_category][:parent_id].empty? && params[:product_category][:parent_id] != @category.parent_id
            parent = Products::ProductCategory.find_by_id params[:product_category][:parent_id]
            parent.children << @category
            parent.save!
          end

          @category.update_attributes params[:product_category]

          redirect_to :back
        end

        def create
          @category = Products::ProductCategory.new(params[:product_category])
          @category.save!
          redirect_to refinery.products_admin_categories_path
        end

        def destroy
          @category = Products::ProductCategory.find(params[:id])
          @category.destroy
          redirect_to refinery.products_admin_categories_path
        end

      end
    end
  end
end
