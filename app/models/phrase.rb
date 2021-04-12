class Phrase < ApplicationRecord
    has_many :moves, -> {order(position: :asc)}
end
