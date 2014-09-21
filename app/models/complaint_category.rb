class ComplaintCategory < ActiveRecord::Base
  belongs_to :complaint
  belongs_to :category
end
