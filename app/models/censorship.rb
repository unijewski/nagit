class Censorship < ActiveRecord::Base
  validates :word, presence: true
end
