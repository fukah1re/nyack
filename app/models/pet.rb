class Pet < ApplicationRecord
  has_one_attached :profile_image

  has_many :posts, dependent: :destroy

  belongs_to :users
  belongs_to :pet_kinds
  belongs_to :pet_breeds
end
