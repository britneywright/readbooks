class AddInitialCopiesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :initial_copies, :integer
  end
end
