class DropCategoryItems < ActiveRecord::Migration
  def change
    drop_table :categories_items
  end
end
