class Complaint < ActiveRecord::Base
  URL_RGX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/
  
  belongs_to :nagger
  has_many :loves

  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }, :allow_blank => true


  def self.top_5_naggers
    group(:nagger_id).order('count_all desc').count.keys.map { |index| Nagger.find(index)}.first(5)
  end

  def self.top_5_complaints
    Love.group(:complaint_id).order('count_all desc').count.keys.map { |index| Complaint.find(index)}.first(5)
  end

end
