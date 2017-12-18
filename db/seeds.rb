# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


our_community = 
  {:name => 'peace-and-love', :login_pwd => 'mouseandsquirrel', 
    :street => 'big street', :number => '123'}


commune=Community.create!(our_community)




saul = 
  { :name => 'saul duphraigne'}




me = commune.residents.create!(saul)

kapital= 
  { :community => commune,  :form => 'book' , :description => 'Das Kapital'}

me.articles.create!(kapital)

