# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  company_number :string
#

describe Client, type: :model do
  it { should have_many :invoices }
end
