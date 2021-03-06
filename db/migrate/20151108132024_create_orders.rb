class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string      :name
      t.decimal     :price,     precision: 7, scale: 2, default: 0, null: false
      t.integer     :quantity,  default: 0, null: false
      t.boolean     :served,    default: false
      t.references  :table,     index: true, foreign_key: true
      t.timestamps              null: false
    end
    add_index :orders, [:table_id, :created_at]
  end
end
