class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :password
      t.string :street
      t.string :number
      t.string :residents
      t.string :salt #for encryption
      t.string :password_digest
    end
    
    create_table :residents do |t|
      t.belongs_to :community, index: true
      t.string :name
      t.string :articles
    end
    
    
    create_table :articles do |t|
      t.belongs_to :resident, index: true
      t.belongs_to :community, index: true
      t.string :form
      t.string :description
      t.string :status
    end
  end
end


