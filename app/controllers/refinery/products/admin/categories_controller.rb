module Refinery
  module Products
    module Admin
      class CategoriesController < ::Refinery::AdminController

        crudify "refinery/products/product_category", :xhr_paging => true

      end
    end
  end
end
