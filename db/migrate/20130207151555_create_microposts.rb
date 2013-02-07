class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps #magic of created_at and updated_at columns
    end
    #we exprect to retrieve microposts associated with a given user_id
    #in reverse of order of creation
    #creating the user_id and created_at columns as an array causes Rails 
    #to create a 'multiple key index':  Active Record will use both keys at 
    #the same time.
    add_index :microposts, [:user_id, :created_at] 
  end
end
