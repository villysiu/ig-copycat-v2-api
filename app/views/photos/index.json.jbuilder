json.array! @photos do |photo|

    json.id photo.id
    
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
    json.desc photo.desc

    json.owner do
        json.id photo.user.id
        json.name photo.user.name
    end 
    json.likes photo.likes do |like|
        json.id like.id
        json.user do
            json.id like.user.id
            json.name like.user.name
        end
    end
        
end