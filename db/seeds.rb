# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# This method adds 10 new users
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

#This method adds avatar urls to users who have none.
# Note: Users created manually through the web interface will have an empty string for their avatar. This will not update those.
def new_photo_url(users)
  print "\nUpdating NULL avatar (Note: empty strings will not be updated): "
  users.each do |user|
    print '.'
    user.photo_url ||= Faker::Avatar.image
    user.save
  end
end

#This method adds between 1 and 5 posts for any users that have less than 2 posts.
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

#this method toggles the follow status of between 1 to 5 users for each user.
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

#run the methods here.
# this runs new_users if there are less than 10 users in the database.
userslist = User.all.length < 10 ? new_users : User.all
new_posts(userslist)
new_follow(userslist)
new_photo_url(userslist)
puts "\nDone."
