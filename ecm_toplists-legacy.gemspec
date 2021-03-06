# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.authors = "Roberto Vasquez Angel"
  s.name = "ecm_toplists-legacy"
  s.summary = "Insert EcmToplists summary."
  s.description = "Insert EcmToplists description."
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.version = "0.0.3"
  s.add_dependency('paperclip', "~> 2.3")
  s.add_dependency('ranked-model') # , 'git://github.com/robotex82/ranked-model.git')
  s.add_dependency('will_paginate', '~> 3.0.pre2')
  s.add_dependency('ecm_admin-legacy')
end
