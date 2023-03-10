json.array! @photos do |photo|

    json.id photo.id
    
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
    json.desc photo.desc
    json.owner_id photo.user.id
    # json.owner do
    #    json.id photo.user.id
    #    json.name photo.user.name
    #    json.bio photo.user.bio
    # end 
    json.likes photo.likes do |like|
        json.id like.id
       # json.user do
            json.user_id like.user_id
          #  json.name like.user.name
      #  end
    end
    json.comments photo.comments do |comment|
        json.id comment.id
        json.user_id comment.user_id
        json.comment comment.comment
        
    end
        
end