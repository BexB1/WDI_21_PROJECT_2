# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["users", "categories", "pledges"].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY CASCADE")
end

[ 
  {
    name: "Health", 
    created_at: "2016-08-07 21:35:19", 
    updated_at: "2016-08-07 21:35:19"
    },
  {
    name: "Productivity", 
    created_at: "2016-08-07 21:36:30", 
    updated_at: "2016-08-07 21:36:30"
    }
    ].each do |category|
      Category.create!(category)
    end


[
  {
    username: "BexB",
    first_name: "Bex",
    last_name: "Bolton",
    created_at: "2016-08-07 21:06:09",
    updated_at: "2016-08-10 17:48:51",
    email: "bexb1@hotmail.com", 
    profile_picture: File.open(Rails.root.join "db/images/myprofilepic.jpg"), 
    coins: 15,
    password: "password",
    password_confirmation: "password"
    },
  {
    username: "SteveyBoi", 
    first_name: "Steve", 
    last_name: "the Legend", 
    created_at: "2016-08-09 08:28:06", 
    updated_at: "2016-08-10 15:29:59", 
    email: "stevey@boi.com", 
    profile_picture: File.open(Rails.root.join "db/images/scumbag-steve.jpg"), 
    coins: 15,
    password: "password",
    password_confirmation: "password"
    }
  ].each do |user|
    User.create!(user)
  end

[
  {
    name: "Code Every Day", 
    description: "I will code for at least 6 hours every day.", 
    amount: 10, 
    user_id: 1, 
    category_id: 2, 
    created_at: "2016-08-09 19:24:38", 
    updated_at: "2016-08-10 14:37:09", 
    daily_post: "2016-08-10 14:37:09", 
    sponsor_id: 2
    },
  {
    name: "Walk more!", 
    description: "I will walk at least 10,000 steps each day.", 
    amount: 10, user_id: 2, 
    category_id: 1, 
    created_at: "2016-08-09 10:21:56", 
    updated_at: "2016-08-10 15:30:22", 
    daily_post: "2016-08-10 15:30:22", 
    sponsor_id: 1
    },
  {
    name: "Sleep 7 hours", 
    description: "I will try to sleep at least 7 hours each night", 
    amount: 20, 
    user_id: 1, 
    category_id: 1, 
    created_at: "2016-08-09 19:41:41", 
    updated_at: "2016-08-11 08:29:17", 
    daily_post: "2016-08-11 08:29:17", 
    sponsor_id: 2
    },
  {
    name: "Test the coins system", 
    description: "see above", 
    amount: nil, 
    user_id: 1, 
    category_id: 2, 
    created_at: "2016-08-11 13:27:51", 
    updated_at: "2016-08-11 14:19:40", 
    daily_post: "2016-08-11 14:19:40", 
    sponsor_id: 2
    }
    ].each do |pledge|
    Pledge.create!(pledge)
  end
