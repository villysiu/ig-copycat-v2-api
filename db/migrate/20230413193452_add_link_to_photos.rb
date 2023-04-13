class AddLinkToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :link, :string
  end
end
