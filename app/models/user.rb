class User < ActiveRecord::Base
  has_secure_password

  has_many :calenders

  validates :email, presence: true,
                    uniqueness: true


  def to_s
    if nickname.nil?
      email.to_s
    else
      nickname.to_s
    end
  end
end
