class Category < ActiveRecord::Base
	validates :name, presence: true
  has_many :complaint_categories
  has_many :complaints, through: :complaint_categories, source: :complaints
end
