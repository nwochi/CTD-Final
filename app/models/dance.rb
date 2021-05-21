class Dance < ApplicationRecord
    has_many :dance_to_phrases, -> {order(position: :asc)}
    has_many :phrases, through: :dance_to_phrases
    
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 5 }
    # def phrases_in_order
    #     self.phrases.sort_by do |phrase|
    #     phrase.name
    # end
    #end
end

# class DanceToPhrase < ApplicationRecord
#   belongs_to :dance
#   belongs_to :phrase
#   acts_as_list scope: :dance
  
# end
# this is our join table