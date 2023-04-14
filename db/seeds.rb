# require Faker
User.destroy_all
Photo.destroy_all

5.times do |index|
    User.create!(

        name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(min_length: 8, max_length: 12),
        bio: Faker::TvShows::Spongebob.quote,
        avatar_link: Faker::Avatar.image
    )
end

20.times do |index|
    word=Faker::Verb.base

    Photo.create!(
        desc: Faker::Lorem.paragraph,
        link: Faker::LoremFlickr.image(size: '500x500', search_terms:["#{word}"], match_all: false),
        user_id: rand(1..User.count),
    )
end
puts "#{User.count} users created"
puts "#{Photo.count} photos created"