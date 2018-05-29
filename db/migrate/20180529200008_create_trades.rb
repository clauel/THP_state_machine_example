class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :aasm_state
      t.string :operation

      t.timestamps
    end
  end
end
