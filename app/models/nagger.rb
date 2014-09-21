class Nagger < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :loves
  has_many :complaints

  scope :top5, -> { order('complaints_count desc').limit(5) }

end
