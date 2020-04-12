guard :rspec, cmd: "bundle exec rspec" do
  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { |m| "spec/features/#{m[1]}" }
  watch(%r{^app/models/(.*)\.rb$})      { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^app/views/(.+)/})  { |m| "spec/features/#{m[1]}" }
end
