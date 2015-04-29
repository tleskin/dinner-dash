class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true

  has_many :item_categories
  has_many :items, :through => :item_categories

  def find_categories(ids)
    categories = []
    ids.each do |id|
      if id.to_i != 0
        categories << Category.find(id.to_i)
      end
    end
    categories
  end

end
