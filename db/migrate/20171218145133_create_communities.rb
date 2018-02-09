class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.string :name
      t.string :street
      t.string :number
      t.string :residents
      t.string :password_digest
    end

    create_table :residents do |t|
      t.belongs_to :community, index: true
      t.string :name
      t.string :articles
      t.string :password_digest
      t.string :phone
      t.string :email
    end


    create_table :articles do |t|
      t.belongs_to :resident, index: true
      t.belongs_to :community, index: true
      t.string :title
      t.string :form
      t.string :description
      t.boolean :available
    end
  end
end
