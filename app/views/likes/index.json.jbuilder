json.array! @likes do |like|  

  #  json.id like.id
    json.user do
      json.id like.user_id
        json.name like.user.name
    end
end