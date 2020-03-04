class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :text
      t.string :page_id
      t.string :wiki_url
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
