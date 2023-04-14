# require Faker
require 'open-uri'
require "openai" 
User.destroy_all
Photo.destroy_all

5.times do |index|
    user=User.create!(

        name: Faker::Name.first_name,
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password(min_length: 8, max_length: 12),
        bio: Faker::TvShows::Spongebob.quote,
        # avatar_link: Faker::Avatar.image
    )
    downloaded_file = URI.open(Faker::Avatar.image)

    user.avatar.attach(io: downloaded_file, filename: "avatar_#{index}.png")
    user.save
end

2.times do |index|
    photo=Photo.new()
    photo.desc = Faker::TvShows::HowIMetYourMother.quote

    photo.user_id = rand(1..User.count)
    # image_url=Faker::LoremFlickr.image(size: '500x500', search_terms:["#{word}"], match_all: false)

    openAIClient = OpenAI::Client.new
    response = openAIClient.images.generate(
        parameters: { 
            prompt: photo.desc, 
            size: "512x512" 
        })
    
    image_url=response.dig("data", 0, "url")
    downloaded_file = URI.open(image_url)

    photo.url.attach(io: downloaded_file, filename: "openai_image_#{index}.png")
    photo.save
   

end
puts "#{User.count} users created"
puts "#{Photo.count} photos created"