class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :telegram
      t.references :price, null: false, foreign_key: true

      t.timestamps
    end
  end
end
