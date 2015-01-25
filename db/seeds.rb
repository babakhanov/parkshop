Category.delete_all
Product.delete_all
SubProduct.delete_all
FilterName.delete_all
FilterValue.delete_all

filters = []
filter_names = []
10.times do |i|
  filters[i] = []
  filter = FilterName.create(
    name: Faker::Commerce.department(1, true)
  )
  filter_names << filter
  6.times do
    filter_value = FilterValue.create(
      title: Faker::Commerce.department(1, true)
    )
    filter_value.filter_name = filter
    filter_value.save
    filters[i] << filter_value
  end

end

3.times do
  category = Category.create( 
    name: Faker::Commerce.department(2, true), 
    title: Faker::Commerce.department(4, true), 
    description: Faker::Commerce.department(6, true) 
  )
  filter_names.each do |item|
    item.category = category
    item.save
  end
  5.times do
    product = Product.create(
      name: Faker::Commerce.product_name,
      title: Faker::Commerce.department(4, true),
      small_text: Faker::Company.catch_phrase,
      description: Faker::Company.catch_phrase
    )
    product.category = category
    product.save
    5.times do
      sub_product = SubProduct.create(
        name: Faker::Commerce.department(1, true),
        price: Faker::Commerce.price
      )
      sub_product.product = product
      sub_product.save
    end
  end
end
