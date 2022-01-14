class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.string :city
      t.integer :user_id
    end
  end
end
