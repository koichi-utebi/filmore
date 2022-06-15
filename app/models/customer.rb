class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :watched_lists, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :favorite, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :profile_image
  validates :name, presence: true, length:{maximum: 10}
  validates :email, presence: true

  scope :latest, -> {order(created_at: :desc)}

  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end

  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : "no_image.jpg"
  end
end
