# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
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
end
