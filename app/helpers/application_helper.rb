module ApplicationHelper
  def full_title(page_title)
    base_title = "Negotiation Assessment"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def navbar_list_item(text, path, opts={})
    return if opts[:hide]
    cls = request.fullpath == path ? 'active' : ''
    content_tag :li, :class => cls do
      link_to text, path, opts
    end
  end

  def flash_class(level)
    case level
    when 'notice' then "alert-info"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-warning"
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-default", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
