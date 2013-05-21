require 'spec_helper'

module Refinery
  module Products
    describe ProductCategory do
      describe "validations" do
        subject do
          FactoryGirl.create(:product_category, :title => "")
        end

      end
    end
  end
end
