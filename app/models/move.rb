class Move < ApplicationRecord
  belongs_to :phrase
  acts_as_list scope: :phrase
end
