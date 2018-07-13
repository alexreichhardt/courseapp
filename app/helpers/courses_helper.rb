module CoursesHelper
  def label_select(filter, value)
    html = nil
    if filter&.include?(value)
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="intermediate" name="criteria[knowledge_level][]" id="criteria_knowledge_level_intermediate" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_knowledge_level_#{value}">
          #{value.capitalize}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="intermediate" name="criteria[knowledge_level][]" id="criteria_knowledge_level_intermediate">
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
        <input class="form-check-input hidden required" type="checkbox" value="intermediate" name="criteria[knowledge_level][]" id="criteria_knowledge_level_intermediate" checked>
        <label class="collection_check_boxes category-choice active" for="criteria_knowledge_level_#{value}">
          #{value}
        </label>
      HTML
    else
      html = <<-HTML
        <input class="form-check-input hidden required" type="checkbox" value="intermediate" name="criteria[knowledge_level][]" id="criteria_knowledge_level_intermediate">
        <label class="collection_check_boxes category-choice" for="criteria_knowledge_level_#{value}">
          #{value}
        </label>
      HTML
    end
    html.html_safe
  end
end
