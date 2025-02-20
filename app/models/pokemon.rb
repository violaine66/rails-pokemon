class Pokemon < ApplicationRecord
  has_many :pokeballs
  has_many :trainers, through: :pokeballs
  has_one_attached :photo

  validates :name, presence: true
  validates :element_type, presence: true
end
