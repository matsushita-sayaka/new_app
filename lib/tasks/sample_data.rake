namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 message: "hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!hello!",
                 admin: true
                 )
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   message: "hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!hi!"
                   )
    end
    users = User.all(limit: 6)
    50.times do
      title = "title"
      category = "learn"
      main_content = Faker::Lorem.sentence(5)
      users.each { |user| user.posts.create!(main_content: main_content, title: title, category: category) }
    end
  end
end