class Category < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true

  has_many :item_categories
  has_many :items, through: :item_categories


  extend FriendlyId
  friendly_id :name, use: :slugged

end
