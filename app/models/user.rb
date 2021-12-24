class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # relationship
  has_many :follows
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_and_belongs_to_many :tags
  has_one_attached :avatar
end
