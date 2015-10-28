class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      
      t.article_id, :integer
      t.tag_id, :integer
      
      t.references :tag, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
