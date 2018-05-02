class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 128, index: { unique: true }
      t.string :password_digest, null: false, limit: 128
      t.boolean :verified, default: false, null: false

      t.timestamps
    end
  end
end
