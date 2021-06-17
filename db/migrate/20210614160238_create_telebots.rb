class CreateTelebots < ActiveRecord::Migration[6.0]
  def change
    create_table :telebots do |t|
      t.integer :chatId
      t.integer :price

      t.timestamps
    end
  end
end
