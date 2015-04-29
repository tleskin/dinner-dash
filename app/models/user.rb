class User < ActiveRecord::Base
  has_attached_file :picture, styles: {micro: '50x50',
                                     thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/


  has_many :orders

  has_secure_password
  validates :name, length: { in: 2..32 }
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  enum role: %w(default admin)

end
