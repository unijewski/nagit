class Complaint < ActiveRecord::Base
  URL_RGX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/

  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }, :allow_blank => true
  belongs_to :nagger
  has_many :loves
end
