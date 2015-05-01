class Item < ActiveRecord::Base
  has_attached_file :image, styles: {micro: '50x50',
                                     thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_many :item_categories
  has_many :categories, through: :item_categories

  scope :active, -> {where(status: true)}
end
