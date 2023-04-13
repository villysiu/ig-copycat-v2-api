json.array! @users do |user|
    json.id user.id
    json.avatar user.avatar_link ||
    ("http://localhost:3000/#{Rails.application.routes.url_helpers.rails_blob_path(user.avatar, only_path: true) if user.avatar.attached?}")
    json.name user.name
    json.email user.email
    json.bio user.bio
  
        
end