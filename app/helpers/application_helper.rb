module ApplicationHelper
  def star_rating(rating)
    content_tag(:div, class: 'star-rating') do
      rating.times do
        concat content_tag(:span, '★', class: 'star yellow-star')
      end
    end
  end

  def dollar_rating(rating)
    content_tag(:div, class: 'dollar-rating') do
      rating.times do
        concat content_tag(:span, '$', class: 'dollar-sign')
      end
    end
  end
end
