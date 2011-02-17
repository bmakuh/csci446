class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name, :null => false

      t.timestamps
    end
    
    add_column :articles, :author_id, :integer
  
    # grab * author name @s from each article
    Article.all.each do |article|
      author = Author.create(:name => article.author_name)
      article.author = author
      article.save
    end
  
    remove_column :articles, :author_name
  end

  def self.down
    add_column :articles, :author_name, :string
    
    Author.all.each do |author|
      aid = Article.find_by_sql("SELECT author_id FROM authors, articles WHERE author_id = authors.id");
      article = Article.update_all("author_name = #{author.name}", "author_id = #{aid}")
      article.save
    end
    
    remove_column :articles, :author_id
    
    drop_table :authors
    
  end
end
