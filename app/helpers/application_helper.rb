module ApplicationHelper

  # Returns the full title on a per-page basis.
  def fullTitle(page_title)
    base_title = "YouFood"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def directorTitle(page_title)
    director_title = "Portail directeur"
    if page_title.empty?
      director_title
    else
      "#{director_title} | #{page_title}"
    end
  end

  def restaurantTitle(page_title)
    restaurant_title = "Portail restaurant"
    if page_title.empty?
      restaurant_title
    else
      "#{restaurant_title} | #{page_title}"
    end
  end
end
