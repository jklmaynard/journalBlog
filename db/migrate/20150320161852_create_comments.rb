class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body

      t.timestamp
    end
  end
end
