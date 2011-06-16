begin
  require "rubygems"
  require "bundler"

  ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)

  Bundler.setup
end
