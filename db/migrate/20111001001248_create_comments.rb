class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article

      t.timestamps
    end
    add_index :comments, :article_id
  end
end
