    json.id @photo.id
    json.url Rails.application.routes.url_helpers.rails_blob_path(@photo.url, only_path: true) if @photo.url.attached?
    json.desc @photo.desc
    json.owner do
        json.id @photo.user.id
        json.name @photo.user.name
    end 

    json.likes []



        
