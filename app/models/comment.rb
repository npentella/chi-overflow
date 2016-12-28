class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User"
  has_many :votes, as: :votable

  validates :content, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
  validates :author_id, presence: true

  include Votable
end
