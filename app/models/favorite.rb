# frozen_string_literal: true

# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_place_id  (place_id)
#  index_favorites_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
class Favorite < ApplicationRecord
  extend ActsAsFavoritor::FavoriteScopes

  belongs_to :user, dependent: :destroy
  belongs_to(:place)

  
end