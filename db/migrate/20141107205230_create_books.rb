class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :year
      t.attachment :cover_image
      t.text :description
      t.string :link
      t.timestamps
    end

    create_table :copies do |t|
      t.integer :copy_number
      t.belongs_to :book
      t.timestamps
    end

    create_table :statuses do |t|
      t.string :borrower_name
      t.string :borrower_email
      t.string :borrower_phone
      t.date :checked_out
      t.date :checked_in
      t.belongs_to :copy
      t.belongs_to :book
      t.timestamps 
    end
  end
end
