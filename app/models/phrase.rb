class Phrase < ApplicationRecord
    has_many :moves, -> {order(position: :asc)}
    validates_presence_of :name
end
