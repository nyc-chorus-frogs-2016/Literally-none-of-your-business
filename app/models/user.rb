class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys
  has_many :questions, through: :surveys
  has_many :choices, through: :questions
  has_many :votes

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
