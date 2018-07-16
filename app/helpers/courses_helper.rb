module CoursesHelper
  def label_select(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[knowledge_level][]" id="criteria_knowledge_level_#{value}" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_knowledge_level_#{value}">
          #{value.capitalize}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[knowledge_level][]" id="criteria_knowledge_level_#{value}">
        <label class="collection_check_boxes category-choice" for="criteria_knowledge_level_#{value}">
          #{value.capitalize}
        </label>
      HTML
    end
    html.html_safe
  end

  def label_select_p(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[platform][]" id="criteria_platform_#{value}" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_platform_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[platform][]" id="criteria_platform_#{value}">
        <label class="collection_check_boxes category-choice" for="criteria_platform_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
  end

  # price filter
  def label_select_price(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[price][]" id="criteria_price_#{value}" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_price_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[price][]" id="criteria_price_#{value}">
        <label class="collection_check_boxes category-choice" for="criteria_price_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
  end

  def label_select_n(key, filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_#{key}_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}">
        <label class="collection_check_boxes category-choice" for="criteria_#{key}_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
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

  def label_select_p_home(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[platform][]" id="criteria_platform_#{value}" checked>
        <label class="collection_check_boxes category-choice-home active" for="criteria_platform_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[platform][]" id="criteria_platform_#{value}">
        <label class="collection_check_boxes category-choice-home" for="criteria_platform_#{value}">
          #{value}
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

  def label_select_n_home(key, filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}" checked>
        <label class="collection_check_boxes category-choice-home active" for="criteria_#{key}_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="#{value}" name="criteria[#{key}][]" id="criteria_#{key}_#{value}">
        <label class="collection_check_boxes category-choice-home" for="criteria_#{key}_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
  end
end

