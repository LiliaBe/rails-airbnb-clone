class AddCoordinatesToInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :latitude, :float
    add_column :instruments, :longitude, :float
  end
end
