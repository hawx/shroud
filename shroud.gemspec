# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{shroud}
  s.version = "0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Joshua Hawxwell"]
  s.cert_chain = ["/Users/Josh/Other/Secure/gem-public_cert.pem"]
  s.date = %q{2010-05-13}
  s.default_executable = %q{shroud}
  s.description = %q{A wrapper for the CloudApp REST API}
  s.email = %q{m@hawx.me}
  s.executables = ["shroud"]
  s.extra_rdoc_files = ["CHANGELOG", "README.markdown", "bin/shroud", "lib/shroud.rb"]
  s.files = ["CHANGELOG", "README.markdown", "Rakefile", "bin/shroud", "lib/shroud.rb", "test/test.rb", "Manifest", "shroud.gemspec"]
  s.homepage = %q{http://github/hawx/shroud}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Shroud", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{shroud}
  s.rubygems_version = %q{1.3.6}
  s.signing_key = %q{/Users/Josh/Other/Secure/gem-private_key.pem}
  s.summary = %q{A wrapper for the CloudApp REST API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<patron>, [">= 0"])
      s.add_runtime_dependency(%q<crack>, [">= 0"])
    else
      s.add_dependency(%q<patron>, [">= 0"])
      s.add_dependency(%q<crack>, [">= 0"])
    end
  else
    s.add_dependency(%q<patron>, [">= 0"])
    s.add_dependency(%q<crack>, [">= 0"])
  end
end
