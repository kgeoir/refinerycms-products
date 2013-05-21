
FactoryGirl.define do
  factory :product_category, :class => Refinery::Products::ProductCategory do
    name { "category_#{this.id}" }
    code { rand(0..100) }
    description { " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at mauris tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse congue varius velit, a vestibulum tellus placerat sit amet. Curabitur augue enim, feugiat id semper vel, imperdiet id diam. Etiam sodales dapibus sodales. Aliquam velit leo, pellentesque a sagittis non, vehicula at erat. Integer at malesuada nulla. Praesent eu mauris elit.

Pellentesque sodales odio a risus porta eleifend. Nunc libero odio, fringilla posuere mollis convallis, malesuada vel purus. Quisque tincidunt, risus vitae ultrices dapibus, dolor arcu porttitor sapien, vitae aliquam ipsum turpis vel lectus. Donec fermentum purus nec odio tincidunt ac imperdiet mauris eleifend. Phasellus consequat laoreet porttitor. Cras sed elit tellus. Praesent ut turpis turpis. Morbi aliquam velit vel nulla pretium non auctor massa blandit. Proin commodo pellentesque lacus, ac scelerisque tellus commodo vel. Nam nisi tortor, sollicitudin ac mollis et, consectetur non augue.

" }

  end
end

