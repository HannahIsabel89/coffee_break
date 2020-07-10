require_relative 'lib/coffee_break/version'

Gem::Specification.new do |spec|
  spec.name          = "coffee_break"
  spec.version       = CoffeeBreak::VERSION
  spec.authors       = ["Shirlen Detablan"]
  spec.email         = ["slen.detablan@gmail.com"]

  spec.summary       = %q{View coffee products on PlayerOneCoffee.}
  spec.description   = %q{See product's roast type, price, and description.}
  spec.homepage      = "https://github.com/Ro5hi/coffee_break"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ro5hi/coffee_break"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.post_install_message = "Thank you for installing coffee_break!"
  spec.executables   = [spec.files.grep(%r{^exe/}) { |f| File.basename(f) }]
  spec.require_paths = ["lib"]
end
