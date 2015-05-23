class User < ActiveRecord::Base
  has_secure_password

  has_many :calenders

  validates :email, presence: true,
                    uniqueness: true


  def to_s
    nickname.to_s
  end
end
