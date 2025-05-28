pin "@editorjs/editorjs", to: "https://esm.sh/@editorjs/editorjs"
pin "@editorjs/list", to: "https://esm.sh/@editorjs/list"
pin "@editorjs/image", to: "https://esm.sh/@editorjs/image"
pin "@kiberpro/editorjs-gallery", to: "https://esm.sh/@kiberpro/editorjs-gallery"
pin "comfy/editorjs/application", to: "comfy/editorjs/application.js"

pin_all_from Comfy::Editorjs::Engine.root.join("app/assets/javascripts/comfy/editorjs/controllers"), under: "comfy/editorjs/controllers"
