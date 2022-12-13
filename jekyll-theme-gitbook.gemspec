Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-gitbook"
  spec.version       = "0.0.6"
  spec.authors       = ["Adam Rehn"]
  spec.email         = ["adam@adamrehn.com"]
  
  spec.summary       = "Gem-based Jekyll theme for documentation sites, inspired by GitBook's visual design language."
  spec.homepage      = "https://github.com/adamrehn/jekyll-theme-gitbook"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README)!i) }
  
  spec.add_runtime_dependency "jekyll", ">= 3.8", "< 5.0"
  
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
end
