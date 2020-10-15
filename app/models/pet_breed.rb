class PetBreed < ApplicationRecord
  belongs_to :pet_kind
  has_many :pets

  validates :name, presence: true
end
