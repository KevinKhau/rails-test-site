class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :user
      alias_attribute :manager, :user
      t.timestamps
    end
  end
end
