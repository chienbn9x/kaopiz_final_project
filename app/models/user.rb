class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  # relationship
  has_many :follows, dependent: :delete_all
  has_many :posts, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :bookmarks, dependent: :delete_all
  has_and_belongs_to_many :tags
  has_one_attached :avatar, dependent: :destroy
end
