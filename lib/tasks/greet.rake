namespace :register do
  desc "年月を登録するタスク"
  task register_year: :environment do
    ActiveRecord::Base.transaction do 
      Item.all.each do |item|
        puts item.name, Date.current.year
        unless Shipping.exists?(item: item, year: Date.current.year)
          shipping = Shipping.new(item: item, year: Date.current.year, user: User.first)
          (1..12).each do |month|
             shipping.shipping_details << ShippingDetail.new(month: month, quantity: 0)
          end
          shipping.save!
        end
      end
    end
  end
end