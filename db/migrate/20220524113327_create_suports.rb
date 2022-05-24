class CreateSuports < ActiveRecord::Migration[6.1]
  def change
    create_table :suports do |t|
      t.string :name

      t.timestamps
    end
  end
end
