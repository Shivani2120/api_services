class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.integer :product_id
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
