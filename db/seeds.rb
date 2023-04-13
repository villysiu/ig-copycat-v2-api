# require Faker
# User.destroy_all
# Photo.destroy_all

# 5.times do |index|
#     avat=Faker::Avatar.image( size: "50x50")
#     puts avat

#     User.create!(

#         name: Faker::Name.first_name,
#         email: Faker::Internet.unique.email,
#         password: Faker::Internet.password(min_length: 8, max_length: 12),
#         bio: Faker::TvShows::Spongebob.quote,
#         avatar: avat
#     )
# end
# 20.times do |index|
#     Photo.create!(
#         desc: Faker::Lorem.paragraph,
#         url: Faker::LoremFlickr.image,
#         user_id: rand(1..5),
#     )
# end
# puts "#{User.count} users and "
# {Photo.count} photos"