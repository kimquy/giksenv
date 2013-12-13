class AddPhotoAttrsToPerson < ActiveRecord::Migration
  def change
    add_column :people, :photo_uid, :string
    add_column :people, :photo_name, :string
  end
end
