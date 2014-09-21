class Complaint < ActiveRecord::Base
  URL_RGX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/
  
  belongs_to :nagger
  has_many :loves

  validates :name, presence: true
  validates :content, presence: true
  validates :url, format: { with: URL_RGX }, :allow_blank => true
<<<<<<< HEAD
  belongs_to :nagger
  has_many :loves
  has_many :complaint_categories
  has_many :categories, through: :complaint_categories, source: :categories
=======


  def self.top_5_naggers
    group(:nagger_id).order('count_all desc').count.keys.map { |index| Nagger.find(index)}.first(5)
  end

  def self.top_5_complaints
    Love.group(:complaint_id).order('count_all desc').count.keys.map { |index| Complaint.find(index)}.first(5)
  end

>>>>>>> 07f481689697b1ffc0e127a00e55c95d4d3bd75d
end
