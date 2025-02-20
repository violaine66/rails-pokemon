class Pokeball < ApplicationRecord
  belongs_to :pokemon
  belongs_to :trainer

  validates :location, presence: true
  validates :caught_on, presence: true
end
