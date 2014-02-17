module Refinery
  module Products
    module Admin
      module CategoriesHelper

        def available_categories(categories)
          list = []
          categories.each do |i|
            list.push [i.name, i.id]
          end
          list
        end
      end
    end
  end
end
