class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :text, :string
      t.column :rating, :integer
      t.column :user, :string

      t.timestamps
    end
  end
end
