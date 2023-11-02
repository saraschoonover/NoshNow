# == Schema Information
#
# Table name: places
#
#  id         :bigint           not null, primary key
#  category   :string
#  image_url  :string
#  location   :string
#  name       :string
#  price      :integer
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Place < ApplicationRecord
  has_many :favorites, dependent: :destroy
  #has_many :favorited_by, through: :favorites, class_name: "User"
  has_many(:favorited_by,
  through: :favorites,
  source: :user
)
end
