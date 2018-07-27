module CoursesHelper
  def label_select(key, filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_#{key}_#{value}">
          #{value.capitalize}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}">
        <label class="collection_check_boxes category-choice" for="criteria_#{key}_#{value}">
          #{value.capitalize}
        </label>
      HTML
    end
    html.html_safe
  end

  def label_select_filter_mobile(key, filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}" checked>
        <label class="collection_check_boxes category-choice-mobile active" for="criteria_#{key}_#{value}">
          #{value.capitalize}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}">
        <label class="collection_check_boxes category-choice-mobile" for="criteria_#{key}_#{value}">
          #{value.capitalize}
        </label>
      HTML
    end
    html.html_safe
  end

  def course_attributes(instructor, number_of_ratings, avg_rating, language, active)
    active = active?(active)
    html = nil
    if number_of_ratings < 3
      html = <<-HTML
        <div class="center-align-3-elements">
          <p style="margin-bottom: 4px;">Instructor<p>
          <p style= "font-weight: 300;">#{instructor.capitalize}</p>
        </div>
        <div class="center-align-3-elements">
          <p style="margin-bottom: 4px;">Language<p>
          <p style= "font-weight: 300;">#{language.capitalize}</p>
        </div>
        <div class="center-align-3-elements">
          <p style="margin-bottom: 4px;">Available now<p>
            #{active}
        </div>
      HTML
    else
      html = <<-HTML
        <div class="center-align-4-elements">
          <p style="margin-bottom: 4px;">Instructor<p>
          <p style= "font-weight: 300;">#{instructor.capitalize}</p>
        </div>
        <div class="center-align-4-elements">
          <p style="margin-bottom: 4px;">Language<p>
          <p style= "font-weight: 300;">#{language.capitalize}</p>
        </div>
        <div class="center-align-4-elements">
          <p style="margin-bottom: 4px;">Available now<p>
          #{active}
        </div>
        <div class="center-align-4-elements">
          <p style="margin-bottom: 4px;">Avg. rating<p>
          <p style= "font-weight: 300;"> #{avg_rating}  </p>
        </div>
      HTML
    end
    html.html_safe
  end

  def active?(input)
    html = nil
    if input == true
      html = <<-HTML
        <p style= "font-weight: 300;">Yes</p>
      HTML
    else
      html = <<-HTML
        <p style= "font-weight: 300;">No</p>
      HTML
      html.html_safe
    end
  end




  ###### Helper for home page #########
  def label_select_home(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[knowledge_level][]" id="criteria_knowledge_level_#{value}" checked>
        <label class="collection_check_boxes category-choice-home active" for="criteria_knowledge_level_#{value}">
          #{value.capitalize}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[knowledge_level][]" id="criteria_knowledge_level_#{value}">
        <label class="collection_check_boxes category-choice-home" for="criteria_knowledge_level_#{value}">
          #{value.capitalize}
        </label>
      HTML
    end
    html.html_safe
  end

   # price filter
  def label_select_price_home(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[price][]" id="criteria_price_#{value}" checked>
        <label class="collection_check_boxes category-choice-home active" for="criteria_price_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[price][]" id="criteria_price_#{value}">
        <label class="collection_check_boxes category-choice-home" for="criteria_price_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
  end

######## link back ######
  def check_levels(levels)
    if levels == ""
      levels = []
    end
  end

  def build_criteria_hash(search, levels, platforms, prices, completion_times)

    criteria_hash = {}

    criteria_hash[:search] = search
    criteria_hash[:knowledge_level] = levels if !levels&.blank?
    criteria_hash[:platform] = platforms if !platforms&.blank?
    criteria_hash[:price] = prices if !prices&.blank?
    criteria_hash[:completion_time] = completion_times if !completion_times&.blank?

    criteria_hash

  end

  def link_to_toggle_course_bookmark(course)

    url_create = course_bookmarks_path(course)

    url_session = new_user_session_path(redirect_to: courses_path(criteria: build_criteria_hash(@search_input, @levels, @platforms, @prices, @completion_times)))

    if !user_signed_in?
      link_to_with_icon('far fa-bookmark', '', url_session, {
          method: 'GET',
          remote: false,
          id: "bookmark-icon",
          class: "single-icon-index",
        })

    else
      bookmark = Bookmark.find_by(course_id: course.id, user_id: current_user.id)
      if course.bookmarked?(current_user.id)
        url_destroy = course_bookmark_path(course.id, bookmark.id)
        link_to_with_icon('fas fa-bookmark', '', url_destroy, {
            method: 'DELETE',
            remote: true,
            id: "bookmark-icon",
            class: "single-icon-index",
            })
      else
        link_to_with_icon('far fa-bookmark', '', url_create, {
            method: 'POST',
            remote: true,
            id: "bookmark-icon",
            class: "single-icon-index",
          })
      end
    end
  end

  def link_to_with_icon(icon_css, title, url, options = {})
        icon = content_tag(:i, nil, class: icon_css)
        title_with_icon = icon << ' '.html_safe << h(title)
        link_to(title_with_icon, url, options)
  end
end
