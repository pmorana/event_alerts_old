class CreatePostcomments < ActiveRecord::Migration
  def change
    create_table :postcomments do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
