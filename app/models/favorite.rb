# frozen_string_literal: true

# == Schema Information
#
# Table name: favorites
#
#  id            :bigint           not null, primary key
#  categories    :string
#  display_phone :string
#  image_url     :string
#  location      :string
#  name          :string
#  price         :string
#  rating        :float
#  review_count  :string
#  transactions  :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#  yelp_id       :string
#
# Indexes
#
#  index_favorites_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  validates_uniqueness_of :yelp_id, scope: :user_id, message: "You've already favorited this restaurant."
end
