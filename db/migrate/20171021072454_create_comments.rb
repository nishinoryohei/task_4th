class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user_name
      t.integer :post_id
      t.text :body

      t.timestamps
    end
  end
end
