module Refinery
  module Products
    class ProductsController < ::ApplicationController

      before_filter do @products = Product.all end
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @product in the line below:
        # present(@page)
        @categories = Products::ProductCategory.roots
        @products = Product.paginate :page => params[:page]
      end

      def show
        @product = Product.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @product in the line below:
        present(@page)
      end

    protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/products").first
      end

    end
  end
end
