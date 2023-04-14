json.array! @photos do |photo|

    json.id photo.id
    puts photo.link
    json.url Rails.application.routes.url_helpers.rails_blob_path(photo.url, only_path: true) if photo.url.attached?
    json.desc photo.desc
    json.owner_id photo.user.id
    json.created_at photo.created_at.to_i
    json.likes photo.likes do |like|
        json.id like.id
        json.user_id like.user_id
        
    end
    json.comments photo.comments do |comment|
        json.id comment.id
        json.user_id comment.user_id
        json.comment comment.comment
        
    end
        
end