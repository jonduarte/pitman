# -*- encoding: utf-8 -*-
# stub: cutest 1.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "cutest"
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Damian Janowski", "Michel Martens", "Cyril David"]
  s.date = "2014-11-05"
  s.description = "Run tests in separate processes to avoid shared state."
  s.email = ["djanowski@dimaion.com", "michel@soveran.com", "me@cyrildavid.com"]
  s.executables = ["cutest"]
  s.files = ["bin/cutest"]
  s.homepage = "https://github.com/djanowski/cutest"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Forking tests."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<clap>, [">= 0"])
    else
      s.add_dependency(%q<clap>, [">= 0"])
    end
  else
    s.add_dependency(%q<clap>, [">= 0"])
  end
end
