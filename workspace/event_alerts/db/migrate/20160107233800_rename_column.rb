class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :chats, :user, :user_name
  end
end
