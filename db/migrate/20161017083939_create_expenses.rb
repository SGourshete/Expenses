class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :user, index: true, foreign_key: true
      t.decimal :amount
      t.string :category
      t.text :description
      t.date :date

      t.timestamps null: false
    end
  end
end
