# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{netrc}
  s.version = "0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Keith Rarick", "geemus (Wesley Beary)"]
  s.date = %q{2012-03-13}
  s.description = %q{This library can read and update netrc files, preserving formatting including comments and whitespace.}
  s.email = %q{geemus@gmail.com}
  s.files = ["LICENSE", "Readme.md", "changelog.txt", "data/permissive.netrc", "data/sample.netrc", "lib/netrc.rb", "test/test_lex.rb", "test/test_netrc.rb", "test/test_parse.rb"]
  s.homepage = %q{https://github.com/geemus/netrc}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Library to read and write netrc files.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<turn>, [">= 0"])
    else
      s.add_dependency(%q<turn>, [">= 0"])
    end
  else
    s.add_dependency(%q<turn>, [">= 0"])
  end
end
