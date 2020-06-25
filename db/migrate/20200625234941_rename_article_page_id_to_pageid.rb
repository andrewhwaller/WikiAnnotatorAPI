class RenameArticlePageIdToPageid < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :page_id, :pageid
  end
end
