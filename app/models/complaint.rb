class Complaint < ActiveRecord::Base
  URL_RGX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix

  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }

  belongs_to :nagger
end
