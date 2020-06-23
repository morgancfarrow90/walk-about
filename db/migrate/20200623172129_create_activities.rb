class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :category_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
