class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :content, :author_id, :question_id, presence: true

  include Votable

end
