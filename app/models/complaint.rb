class Complaint < ActiveRecord::Base
  URL_RGX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/
  
  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }, :allow_blank => true
  has_many :loves
  has_many :complaint_categories
  has_many :categories, through: :complaint_categories
  belongs_to :nagger, counter_cache: true


  scope :top5, -> { order('loves_count desc').limit(5) }


end
