class ComfortableMediaSurfer::Content::Tags::Editorjs < ComfortableMediaSurfer::Content::Tags::Fragment
  def render
    renderable ? Comfy::Cms::ContentController.render(partial: 'comfy/cms/content/editorjs/renderer', locals: { content: JSON.parse(content) }) : ''
  end

  def form_field(object_name, view, index)
    name    = "#{object_name}[fragments_attributes][#{index}][content]"
    options = { id: form_field_id, value: content, class: "d-none", data: { editorjs_target: 'input' } }
    input   = view.send(:text_area_tag, name, content, options)
    yield ('<div data-controller="editorjs">' + input + '<div data-editorjs-target="editor"></div></div>').html_safe
  end
end
