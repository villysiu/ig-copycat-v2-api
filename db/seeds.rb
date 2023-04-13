# require Faker
User.destroy_all
Photo.destroy_all

5.times do |index|
    # avat=Faker::Avatar.image( size: "50x50")
    # puts avat

    User.create!(

        name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(min_length: 8, max_length: 12),
        bio: Faker::TvShows::Spongebob.quote,

    )
end
arr=['sports', 'animal','baby', "tulip", "coffee", "puppy", "peanut", "yoga","stretch","ladder",
    "fruit", "rose", "spaghetti", "computer", "music", "kids", "car", "airplane", "beach", "icecream"]
20.times do |index|
    Photo.create!(
        desc: Faker::Lorem.paragraph,
        # link: Faker::LoremFlickr.unique.image,
link: Faker::LoremFlickr.image(size: '300x300', search_terms:["#{arr[index%arr.count]}"], match_all: false),
        user_id: rand(1..5),
    )
end
puts "#{User.count} users created"
puts "#{Photo.count} photos created"