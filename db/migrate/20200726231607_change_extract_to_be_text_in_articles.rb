class ChangeExtractToBeTextInArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :extract, :text
  end
end
