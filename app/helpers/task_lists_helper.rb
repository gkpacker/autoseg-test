module TaskListsHelper
  def link_to_add_row(name, f, association, **attrs)
    new_task = f.object.send(association).klass.new
    id = new_task.object_id
    fields = f.fields_for(association, new_task, child_index: id) do |t|
      render(association.to_s.singularize, f: t)
    end
    link_to(name, '#', class: "add_fields " + attrs[:class], data: {id: id, fields: fields.gsub("\n", "")})
  end
end
