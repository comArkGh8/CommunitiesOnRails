# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


our_community =
  {:name => 'hippie',
    :password => 'dariush1318',
    :password_confirmation => 'dariush1318',
    :street => 'big street', :number => '123'}


commune=Community.create!(our_community)




saul =
  { :name => 'saul',
    :password => 'dariush1318',
    :password_confirmation => 'dariush1318'}




me = commune.residents.create!(saul)

kapital=
  { :community => commune,  :form => 'book' , :description => 'socialist book',
    :title => 'Das Kapital', :available => true
  }

me.articles.create!(kapital)
