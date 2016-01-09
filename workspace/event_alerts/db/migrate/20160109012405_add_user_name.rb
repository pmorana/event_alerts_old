class AddUserName < ActiveRecord::Migration
  def change
  	add_column :precomments, :user_name, :string
  	add_column :postcomments, :user_name, :string
  end
end
