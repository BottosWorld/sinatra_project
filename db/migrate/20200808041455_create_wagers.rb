class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :user_id
      t.string :bet
      t.integer :amount

      t.timestamps null: false
    end
  end
end
