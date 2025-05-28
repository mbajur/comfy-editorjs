import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs";
import EditorJS from '@editorjs/editorjs'
import List from '@editorjs/list';
import Image from '@editorjs/image';
import Gallery from '@kiberpro/editorjs-gallery';
import Sortable from 'sortablejs';

export default class extends Controller {
  static targets = ['editor', 'input']

  connect() {
    const imageUpload = new URL(document.querySelector('meta[name="cms-file-upload-path"]').content, document.baseURI);
    imageUpload.searchParams.set("source", "editorjs");
    imageUpload.searchParams.set("type", "image");

    this.editor = new EditorJS({
      holder: this.editorTarget,
      onChange: this.handleChange.bind(this),
      data: JSON.parse(this.inputTarget.value || '{}'),
      placeholder: 'Add your first content block...',
      tools: {
        list: List,
        gallery: {
          class: Gallery,
          config: {
            sortableJs: Sortable,
            endpoints: {
              byFile: imageUpload.toString(),
            },
            additionalRequestHeaders: {
              'X-CSRF-TOKEN': Rails.csrfToken()
            },
            field: 'file[file]'
          }
        },
        image: {
          class: Image,
          config: {
            endpoints: {
              byFile: imageUpload.toString(),
            },
            additionalRequestHeaders: {
              'X-CSRF-TOKEN': Rails.csrfToken()
            },
            field: 'file[file]'
          }
        }
      }
    });
  }

  disconnect() {
    this.editor.destroy()
  }

  handleChange() {
    this.editor.save().then((outputData) => {
      this.inputTarget.value = JSON.stringify(outputData)
    }).catch((error) => {
      console.log('Saving failed: ', error)
    });
  }
}
