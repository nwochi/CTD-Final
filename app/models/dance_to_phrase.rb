class DanceToPhrase < ApplicationRecord
  belongs_to :dance
  belongs_to :phrase
  acts_as_list scope: :dance
  
end
# this is our join table