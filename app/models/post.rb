class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :bookmarks
  has_and_belongs_to_many :tags

  has_rich_text :content
  has_one :action_text_rich_text,
    class_name: 'ActionText::RichText',
    as: :record

  is_impressionable
end
