class PetKind < ApplicationRecord
  has_many :pet_breeds, dependent: :destroy

  validates :name, presence: true
end
