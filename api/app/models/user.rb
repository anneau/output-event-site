class User < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :qiitas_id
  end

  belongs_to :team
end
