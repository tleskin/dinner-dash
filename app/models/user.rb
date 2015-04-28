class User < ActiveRecord::Base
  has_attached_file :picture, styles: {micro: '50x50',
                                     thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/


  has_many :orders

  has_secure_password
  validates :name, presence: true, length: { in: 2..32 }
  validates :username, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


end
