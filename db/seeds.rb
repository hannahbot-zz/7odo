require 'faker'

1.times do
  u = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'password',
  )
  u.save

  lists = []
    1.times do
      lists << u.lists.create(
        title: Faker::Lorem.words(rand(1..3)).join(" ")
      )
    end

  # items = []
  #   rand(4..10).times do
  #     list = lists.first
  #     items << u.items.create(
  #       description: Faker::Lorem.words(rand(1..3)).join(" ")
  #     )
  #   end
end

u = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'password',
)
u.save

u = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'password',
)
u.save
