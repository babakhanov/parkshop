Category.delete_all
Product.delete_all
SubProduct.delete_all
FilterName.delete_all
FilterValue.delete_all

filters = []
filter_names = []
filters_all = []
15.times do |i|
  filters[i] = []
  filter = FilterName.create(
    name: Faker::Commerce.department(1, true)
  )
  filter_names << filter
  14.times do
    filter_value = FilterValue.create(
      title: Faker::Commerce.department(1, true)
    )
    filter_value.filter_name = filter
    filter_value.save
    filters[i] << filter_value
    filters_all.push filter_value
  end

end

3.times do
  category = Category.create( 
    name: Faker::Commerce.department(2, true), 
    title: Faker::Commerce.department(4, true), 
    description: Faker::Commerce.department(6, true) 
  )
  1500.times do
    product = Product.create(
      name: Faker::Commerce.product_name,
      title: Faker::Commerce.department(4, true),
      small_text: Faker::Company.catch_phrase,
      description: Faker::Company.catch_phrase
    )
    product.category = category
    product.save
    6.times do
      sub_product = SubProduct.create(
        name: Faker::Commerce.department(1, true),
        price: Faker::Commerce.price
      )
      sub_product.product = product
      sub_product.save
      buf_filters = filters_all.dup
      3.times do
        count = buf_filters.length - 1
        foo = rand(count)
        sub_product.filter_values << buf_filters[foo]
        buf_filters.delete_at(foo)
        puts buf_filters.length
      end
    end
  end
end
