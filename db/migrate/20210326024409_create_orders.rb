class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer   :credit_info,      null: false
      t.integer   :credit_deadline,  null: false
      t.integer   :credit_code,      null: false
      t.timestamps
    end
  end
end
