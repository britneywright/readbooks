class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :copies
      t.string :year
      t.string :cover_image
      t.timestamps
    end
  end
end
