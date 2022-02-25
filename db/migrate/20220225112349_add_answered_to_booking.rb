class AddAnsweredToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :answered, :boolean, default: false
  end
end
