class User < ActiveRecord::Base
  validates :username, :email, { presence: true, uniqueness: true }
  validates :email, format: { with: /.+@.+[.].+/ }
  validate :password_cannot_be_blank

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @plain_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def password_cannot_be_blank
    if @plain_password.empty?
      errors.add(:password, "can't be blank")
    end
  end

  def self.authenticate(username, password)
    user_to_authenticate = User.find_by(username: username)
    return user_to_authenticate if user_to_authenticate && user_to_authenticate.password == password
    nil
  end
end


