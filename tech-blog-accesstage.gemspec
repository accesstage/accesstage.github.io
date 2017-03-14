# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "tech-blog-accesstage"
  spec.version       = "0.1.0"
  spec.authors       = ["Leonardo Tonin Neto"]
  spec.email         = ["leonardo.neto@accesstage.com.br"]

  spec.summary       = %q{Os desafios de uma arquitetura open-source no mundo corporativo}
  spec.homepage      = "https://accesstage.github.io/"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(_layouts|_includes|_sass|LICENSE|README)/i}) }

  spec.add_development_dependency "jekyll", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
