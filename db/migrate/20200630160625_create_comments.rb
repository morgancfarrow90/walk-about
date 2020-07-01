class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.string :title
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
