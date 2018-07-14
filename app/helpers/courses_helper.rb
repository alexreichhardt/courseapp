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
end
