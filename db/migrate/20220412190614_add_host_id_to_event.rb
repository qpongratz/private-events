class AddHostIdToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :host, foreign_key: { to_table: :users }
  end
end
