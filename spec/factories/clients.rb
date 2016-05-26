# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  company_number :string
#

FactoryGirl.define do
  factory :client do
    name Faker::Commerce.product_name
    company_number Faker::Code.ean
  end
end
