class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.article_id :integer
      t.category_id :integer

      t.timestamps null: false
    end
  end
end
