# == Schema Information
#
# Table name: invoices
#
#  id          :integer          not null, primary key
#  number      :string
#  price       :float
#  vat_rate    :integer
#  issued_at   :datetime
#  client_id   :integer
#  category_id :integer
#

FactoryGirl.define do
  factory :invoice do
    number Faker::Code.ean
    price Faker::Commerce.price
    vat_rate 21
    issued_at Faker::Time.between(4.months.ago, Date.today, :all)
    client { create(:client) }
    category { create(:category) }
  end
end
