class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  validates :user_id, presence: true
  validates :status, presence: true
  validates :subtotal, presence: true

  enum status: %w(ordered completed cancelled)

  def self.currently_ordered
    ordered.count
  end

  def self.currently_completed
    completed.count
  end

  def self.currently_cancelled
    cancelled.count
  end
end
