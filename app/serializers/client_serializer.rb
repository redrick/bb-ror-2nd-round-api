# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  company_number :string
#

class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name
end
