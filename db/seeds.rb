Category.delete_all
Product.delete_all
SubProduct.delete_all
FilterName.delete_all
FilterValue.delete_all

categories = {}
names = {}
filter_values = {}
filter_values_all = {}

json = ActiveSupport::JSON.decode(File.read('db/seeds/catalog.json'))
json.each do |product|
  key = product["category"]
  if !defined? categories[key].id
    buf_name = key.split("_").each{|i| i.capitalize!}.join(" ")
    cat = Category.create :name => buf_name, :title => buf_name + " title", :description => buf_name + ' description' 
    categories[key] = cat
  end
  prod = Product.create :name => product['name'], :title => product['name'], :small_text => product['link'], :description => product['description']
  pic = ProductPic.new 
  pic.remote_image_url = product['image_url']
  pic.save
  prod.product_pics << pic
  categories[key].products << prod
  categories[key].save
  product["subs"].each do |sub|
    puts product["link"]
    item = SubProduct.create :name => sub["sku"], :price => sub["price"].to_f
    prod.sub_products << item
    sub.each do |i, val|
      if i != "sku" && i != "price"
        if !defined? names[i].id
          names[i] = FilterName.create :name => i.capitalize
          filter_values[i] = []
          filter_values_all[i] = {}
        end
        if !filter_values[i].include? val
          value = FilterValue.create :title => val
          names[i].filter_values << value
          filter_values[i] << val
          filter_values_all[i][val] = value
        end
        item.filter_values << filter_values_all[i][val]
        item.save
      end
    end
  end

end
