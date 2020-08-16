class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes %i[id name points_count likes_count items_count]

  has_many :users, serializer: Api::V1::UserSerializer
end
