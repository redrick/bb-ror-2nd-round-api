# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

FactoryGirl.define do
  factory :category do
    name Faker::Commerce.product_name
  end
end
