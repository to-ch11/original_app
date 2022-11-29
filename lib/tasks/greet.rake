namespace :register do
  desc "年月を登録するタスク"
    task register_year: :environment do
      ActiveRecord::Base.transaction do 
        Item.all.each do |item|
        unless Shipping.exists?(item: item, year: Date.current.year)
        shipping = Shipping.new(item: item, year: Date.current.year)
        shipping.save!
        end
      end
    end
  end
end