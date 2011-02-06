class UpdateDateColumn < ActiveRecord::Migration
  def self.up
    change_column :articles, :creation_date, :date, :default => Date.today(:date)
  end

  def self.down
  end
end
