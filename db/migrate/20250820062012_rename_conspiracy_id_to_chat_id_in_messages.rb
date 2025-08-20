class RenameConspiracyIdToChatIdInMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :conspiracy_id, :chat_id
  end
end
