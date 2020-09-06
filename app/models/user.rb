class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_one_attached :profile_image

  has_many :pets, dependent: :destroy
  has_many :my_posts, through: :pets, source: :posts
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :posts
  has_many :comments, dependent: :destroy

  validates :username, presence: true
  validates :introduce, length: { maximum: 150 }

  # 自分がフォローしているユーザとの関連
  has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followings, through: :active_relationships, source: :followed

  # 自分をフォローしているユーザとの関連
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # フォロー済みかチェック
  def following?(other_user)
    following.include?(other_user)
  end
end
