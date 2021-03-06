# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rack-smoke}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Schwarz"]
  s.date = %q{2009-10-29}
  s.description = %q{Expose Smoke sources and transcode them into JSON, XML or YAML}
  s.email = %q{ben.schwarz@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "config.ru",
     "examples/smoke-source.rb",
     "lib/rack/smoke.rb",
     "lib/rack-smoke.rb",
     "public/css/base.css",
     "public/css/reset.css",
     "rack-smoke.gemspec",
     "spec/rack-smoke_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/source.rb",
     "views/index.haml",
     "views/layout.haml",
     "views/usage.haml"
  ]
  s.homepage = %q{http://github.com/benschwarz/rack-smoke}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rack-smoke}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Expose Smoke sources and transcode them into JSON, XML or YAML}
  s.test_files = [
    "spec/rack-smoke_spec.rb",
     "spec/spec_helper.rb",
     "spec/support/source.rb",
     "examples/smoke-source.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
      s.add_runtime_dependency(%q<smoke>, ["= 0.5.17"])
      s.add_runtime_dependency(%q<haml>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
      s.add_dependency(%q<smoke>, ["= 0.5.17"])
      s.add_dependency(%q<haml>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
    s.add_dependency(%q<smoke>, ["= 0.5.17"])
    s.add_dependency(%q<haml>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
  end
end

