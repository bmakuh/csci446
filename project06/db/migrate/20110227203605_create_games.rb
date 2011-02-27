class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title, :null => false, :unique => true
      t.string :rating, :null => false, :default => "Unrated"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
