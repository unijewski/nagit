class ComplaintSerializer < ActiveModel::Serializer
  attributes :id, :name, :content
  has_many :categories
end
