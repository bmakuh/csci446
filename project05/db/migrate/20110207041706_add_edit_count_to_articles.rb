class AddEditCountToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :edit_count, :integer
  end

  def self.down
    remove_column :articles, :edit_count
  end
end
