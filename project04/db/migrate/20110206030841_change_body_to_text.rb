class ChangeBodyToText < ActiveRecord::Migration
  def self.up
    change_column :articles, :body, :text
    change_column :articles, :creation_date, :date
  end

  def self.down
  end
end
