class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :user
      t.timestamps
    end
  end
end
