class CreatePrecomments < ActiveRecord::Migration
  def change
    create_table :precomments do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
