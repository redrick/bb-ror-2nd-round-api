# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  company_number :string
#

class Client < ActiveRecord::Base
  has_many :invoices
end
