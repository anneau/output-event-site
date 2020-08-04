class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes %i[id name points_count likes_count items_count]
end
