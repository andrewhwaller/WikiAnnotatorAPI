class RemoveWikiUrlFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :wiki_url, :string
  end
end
