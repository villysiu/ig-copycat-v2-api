    json.id @photo.id
    json.url Rails.application.routes.url_helpers.rails_blob_path(@photo.url, only_path: true) if @photo.url.attached?
    
    #json.url Rails.application.routes.url_helpers.rails_blob_path(@photo.url, only_path: true) if @photo.url.attached?
    json.desc @photo.desc
    json.owner_id @photo.user.id
    json.created_at @photo.created_at.to_i
    
    json.likes []
    json.comments []



        
