Gem::Specification.new do |s|
  s.name     = "acts_as_video_fu"
  s.version  = "1.3"
  s.date     = "2009-03-15"
  s.summary  = "Rails plugin that easily allows you to show video streams on your site."
  s.email    = "matt@matt-darby.com"
  s.homepage = "http://github.com/mdarby/acts_as_video_fu/tree/master"
  s.description = "Rails plugin that easily allows you to show video streams on your site."
  s.has_rdoc = false
  s.authors  = ["Matt Darby"]
  s.files    = ["init.rb",
                "install.rb",
                "lib/acts_as_video_fu.rb",
                "lib/acts_as_video_fu_helper.rb",
                "lib/vimeo.rb",
                "lib/you_tube.rb",
                "MIT-LICENSE",
                "rails/init.rb",
                "Rakefile",
                "README",
                "tasks/acts_as_video_fu_tasks.rake",
                "test/acts_as_video_fu_test.rb",
                "uninstall.rb"]
  s.add_dependency("httparty", [">= 0.3.1"])
end