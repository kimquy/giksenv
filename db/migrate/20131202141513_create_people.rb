class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :company
      t.string :github
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
