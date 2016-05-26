# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

describe Category, type: :model do
  it { should have_many :invoices }
end
