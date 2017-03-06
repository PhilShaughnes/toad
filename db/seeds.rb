# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def new_users
  print "\nadding 10 new users: "
  users = []
  10.times do
    print '.'
    user = User.create!(
      username: Faker::Pokemon.unique.name,
      first_name: Faker::Superhero.descriptor,
      last_name: Faker::Superhero.suffix,
      email: Faker::Internet.unique.email,
      password: "password"
    )
    users << user
  end
  users
end

def new_photo_url(users)
  users.each do |user|
    user.photo_url ||= Faker::Avatar.image
  end
end

def new_posts(users)
  print "\nchecking for posts: "
  users.each do |user|
    rand(1..5).times do
      print '.'
      user.posts.create!(
        message: Faker::ChuckNorris.fact
      )
    end if user.posts_count < 2
  end
end

def new_follow(users)
  print "\nmixing up some follows: "
  users.each do |user|
    rand(1..5).times do
      print '.'
      user.toggle_follow!(users.sample)
     end
  end
end

print "starting..."
userslist = User.all.length < 10 ? new_users : User.all
new_posts(userslist)
new_follow(userslist)
new_photo_url(userslist)
puts "\nDone."
