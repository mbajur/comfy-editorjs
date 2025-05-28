module Comfy
  module Editorjs
    class Engine < ::Rails::Engine
      isolate_namespace Comfy::Editorjs

      # config.to_prepare do

      # end

      initializer "comfy-editorjs.importmap", before: "comfortable_media_surfer.importmap" do |app|
        ComfortableMediaSurfer.configuration.additional_importmap_modules << 'comfy/editorjs/application'

        # throw app.config.importmap
        # app.config.importmap.paths << root.join("config/importmap.rb")
        # app.config.importmap.cache_sweepers << root.join("app/assets/javascripts")
        # app.config.importmap.cache_sweepers << root.join("app/javascript")
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end

      initializer "comfortable_media_surfer.content_tags.editorjs" do |app|
        ComfortableMediaSurfer::Content::Renderer.register_tag(
          :editorjs, ComfortableMediaSurfer::Content::Tags::Editorjs
        )
      end
    end
  end
end
