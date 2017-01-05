class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :body
      t.integer :article_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
