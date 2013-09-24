require 'will_paginate/array'

module Refinery
  module Products
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify "refinery/products/product_category", :xhr_paging => true

        before_filter do @categories = Products::ProductCategory.all end

        def index
          @categories = Products::ProductCategory.all.paginate(:page => 1)
        end

        def new
          @category = Products::ProductCategory.new
        end

        def update
          @category = Products::ProductCategory.find params[:id]

          @category.update_attributes params[:category]

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
