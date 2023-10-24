# == Schema Information
#
# Table name: recommendations
#
#  id         :integer          not null, primary key
#  category   :string
#  location   :string
#  price      :integer
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recommendation < ApplicationRecord
end
