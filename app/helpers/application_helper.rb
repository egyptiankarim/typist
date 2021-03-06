module ApplicationHelper
  # Quick way to automate pretty page titles.
  def view_title(page_title)
    content_for(:title) { page_title }
  end

  # Quick way to highlight active navigation bar areas.
  def is_active?(controller_action)
    "#{params[:controller]}\##{params[:action]}" == controller_action ? "active" : nil
  end

  def information_types_table(information_types)
    render("shared/information_type_table", information_types: information_types)
  end

  def impact_level_text(impact_level)
    impact_level = ImpactLevel.where(impact_level: impact_level).first

    case impact_level.impact_level
    when 1
      impact_level_color = "info"
    when 2
      impact_level_color = "warning"
    when 3
      impact_level_color = "danger"
    else
      impact_level_color = "default"
    end

    impact_level_text = "<strong class='text-%s'>%s</strong>" %
    [impact_level_color, impact_level.name.capitalize]

    return impact_level_text.html_safe

    # Took this out and went with the string above because it was adding inexplicable whitespace. Ugh!
    #render("shared/impact_level_text", impact_level: impact_level, impact_level_color: impact_level_color)
  end
end
