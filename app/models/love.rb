class Love < ActiveRecord::Base
  belongs_to :nagger
  belongs_to :complaint

end
