class User < ActiveRecord::Base

  has_many :orders

  has_secure_password
  validates :name, presence: true, length: { in: 2..32 }
  validates :username, presence: true
  validates :email, presence: true


end
