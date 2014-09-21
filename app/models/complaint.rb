class Complaint < ActiveRecord::Base
  URL_RGX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/

  belongs_to :nagger, counter_cache: true
  has_many :loves

  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }, :allow_blank => true
end
