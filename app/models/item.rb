class Item < ActiveRecord::Base
  has_attached_file :image, styles: {micro: '50x50',
                                     thumb: '100x100',
                                     small: '200x200',
                                     medium: '300x300'
                                   }, default_url: "fork_knife_thumb.jpg"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png"]
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validate  :has_categories?

  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

  scope :active, -> { where(status: true) }

  def show_status
    if status == true
      "active"
    else
      "retired"
    end
  end

  def has_categories?
    errors.add :base, "Item must belong to at least one category." if categories.count < 1
  end
end
