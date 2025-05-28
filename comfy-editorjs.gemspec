require_relative "lib/comfy/editorjs/version"

Gem::Specification.new do |spec|
  spec.name        = "comfy-editorjs"
  spec.version     = Comfy::Editorjs::VERSION
  spec.authors     = ["mbajur"]
  spec.email       = ["mbajur@gmail.com"]
  spec.homepage    = "Editor.js integration for Comfy::CMS"
  spec.summary     = "Editor.js integration for Comfy::CMS"
  spec.description = "Editor.js integration for Comfy::CMS"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mbajur/comfy-editorjs"
  spec.metadata["changelog_uri"] = "https://github.com/mbajur/comfy-editorjs"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.5.1"
end
