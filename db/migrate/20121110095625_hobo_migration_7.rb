class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :stories, :place, :string
    add_column :stories, :description, :string
  end

  def self.down
    remove_column :stories, :place
    remove_column :stories, :description
  end
end
