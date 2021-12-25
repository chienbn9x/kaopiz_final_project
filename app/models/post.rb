class Post < ApplicationRecord
  # validates
  validates :title, presence: true
  validates :content, presence: true

  # relationship
  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :bookmarks, dependent: :delete_all
  has_and_belongs_to_many :tags

  has_rich_text :content
  has_one :action_text_rich_text,
    class_name: 'ActionText::RichText',
    as: :record

  # count view
  is_impressionable
end
