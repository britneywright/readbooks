class AddAvailabilityToCopies < ActiveRecord::Migration
  def change
    add_column :copies, :availability, :boolean
  end
end
