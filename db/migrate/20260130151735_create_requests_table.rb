class CreateRequestsTable < ActiveRecord::Migration[8.1]
  def change
    create_enum :requests_status, %w[pending
                                     pickup_confirmed
                                     picked_up
                                     in_progress
                                     ready_for_delivery
                                     delivery_confirmed
                                     delivered
                                     cancelled]

    create_table :requests do |t|
      t.enum :status, enum_type: :requests_status, null: false, default: "pending"
      t.string :customer_id
      t.string :name
      t.string :email
      t.string :phone, null: false
      t.string :city, null: false
      t.string :address_line_1, null: false
      t.string :address_line_2
      t.integer :number_of_items
      t.decimal :weight, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :pick_up_at
      t.datetime :delivery_at

      t.timestamps
    end

    add_index :requests, :customer_id, unique: true
  end
end
