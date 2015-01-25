require Rails.root.join('spec/factories.rb')

Category.delete_all

50.times do 
  FactoryGirl.create :category
end
