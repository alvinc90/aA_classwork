# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{ username: "BooSqua"  }, { username: "Dr.Bonz"  }, { username:"Blue Dinosaur" }, { username:"tnasty"  }, { username:"The Hulk" }])

Artwork.create([{ title: "Monalisa", image_url: "https://upload.wikimedia.org/wikipedia/commons/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg", artist_id: User.find_by(username: "BooSqua").id}, {title: "Persistance of Time", image_url: "https://upload.wikimedia.org/wikipedia/en/d/dd/The_Persistence_of_Memory.jpg", artist_id: User.find_by(username: "Dr.Bonz").id} ])



Artwork.create(title: 'The Scream', image_url:"https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FThe_Scream&psig=AOvVaw1GMl9Ld4kYYZt31PSOwHpB&ust=1599261560113000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIjdwduPzusCFQAAAAAdAAAAABAF", artist_id: User.find_by(username: "Blue Dinosaur").id) 
Artwork.create(title: 'Professor Hulk', image_url:"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.syfy.com%2Fsyfywire%2Favengers-endgame-smart-hulk-thor-hawkeye&psig=AOvVaw3Lca5ouCOTYOVmJCt5U4jp&ust=1599261800942000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMjywM-QzusCFQAAAAAdAAAAABAJ", artist_id: User.find_by(username: "The Hulk").id) 