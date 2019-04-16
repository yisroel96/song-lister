50.times do
  User.create(
    email: Faker::Internet.free_email,
    username: Faker::Name.name,
    password: "password")
end

50.times do
  Song.create(
    title: Faker::ProgrammingLanguage.name,
    artist: Faker::Company.bs,
    genre: Faker::Name.unique.name,
    user_id: User.all.sample.id)
end
