class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :stories, :notes, :string
  end

  def self.down
    remove_column :stories, :notes
  end
end
