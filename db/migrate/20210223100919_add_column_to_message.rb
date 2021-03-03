class AddColumnToMessage < ActiveRecord::Migration[6.0]
  def change
  	add_reference :messages, :conversation, index: true
    add_foreign_key :messages, :conversations
  end
end
