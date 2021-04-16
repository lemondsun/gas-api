class CreateGasPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :gas_prices do |t|
      t.float :gas_price

      t.timestamps
    end
  end
end
