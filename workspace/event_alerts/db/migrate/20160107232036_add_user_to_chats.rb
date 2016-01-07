class AddUserToChats < ActiveRecord::Migration
  def change
    add_column :chats, :user, :string
  end
end
