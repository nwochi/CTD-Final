class Move < ApplicationRecord
  belongs_to :phrase
  acts_as_list scope: :phrase
  validates_presence_of :name, :position, :phrase
end
