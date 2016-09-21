class UpdateColumnToArticle < ActiveRecord::Migration[5.0]
  def up
    change_column :articles, :l_description, :text
    remove_reference(:articles, :category, index: true, foreign_key: true)
  end

  def down
    change_column :articles, :l_description, :string
    add_reference(:articles, :category, index: true, foreign_key: true)
  end
end
