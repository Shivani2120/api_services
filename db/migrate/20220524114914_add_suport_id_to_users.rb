class AddSuportIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :suport_id, :integer
  end
end
