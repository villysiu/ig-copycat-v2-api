json.array! @users do |user|

    json.id user.id
    
    json.avator Rails.application.routes.url_helpers.rails_blob_path(user.avator, only_path: true) if user.avator.attached?
    json.name user.name
    json.email user.email
    json.bio user.bio
  
        
end