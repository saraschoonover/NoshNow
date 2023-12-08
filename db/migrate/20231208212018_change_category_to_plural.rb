class ChangeCategoryToPlural < ActiveRecord::Migration[7.0]
  def change
    rename_column :favorites, :category, :categories
  end
end
