class AddRoleToUsers < ActiveRecord::Migration[8.1]
  def change
    create_enum :user_role, %w[admin courier operator coordinator]
    add_column :users, :role, :enum, enum_type: :user_role, default: "operator", null: false
  end
end
