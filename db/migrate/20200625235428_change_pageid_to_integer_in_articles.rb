class ChangePageidToIntegerInArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :pageid
    add_column :articles, :pageid, :integer
  end
end
