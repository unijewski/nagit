class Love < ActiveRecord::Base
  belongs_to :nagger
  belongs_to :complaint
  validates_uniqueness_of :nagger, scope: :complaint_id
end
