class PetKind < ApplicationRecord
  has_many :pets
  has_many :pet_breeds, dependent: :destroy

  validates :name, presence: true
end
