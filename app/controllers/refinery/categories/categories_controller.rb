module Refinery
  module Categories
    class CategoriesController < ::ApplicationController

      before_filter :find_page

      def index
        @categories = Products::ProductCategory.roots
      end

      def show
        @category = Products::ProductCategory.find_by_id(params[:id])
      end

      protected

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/categories").first
      end

    end
  end
end
