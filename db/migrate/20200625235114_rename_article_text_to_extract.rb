class RenameArticleTextToExtract < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :text, :extract
  end
end
