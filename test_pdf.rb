require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'prawn'
end
require 'prawn'
Prawn::Document.generate("hello.pdf") do
  text "Hello World!"
end
puts "PDF generated"
