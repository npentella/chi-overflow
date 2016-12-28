class Question < ActiveRecord::Base
  has_many :answers
  has_one :best_answer, class_name: 'Answer'
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :author_id, :content, :title, presence: true

  include Votable
end
