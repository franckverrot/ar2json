# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ar2json}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Franck Verrot"]
  s.date = %q{2011-06-21}
  s.description = %q{ar2json provides a `to_json` method on an ActiveRecord::Relation object.
This method will return a JSON representation, in a String object, of
the resultset.

Why is this useful? Because the JSON is mostly outputed by your database engine.}
  s.email = ["franck@verrot.fr"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = [".autotest", ".rvmrc", "CHANGELOG.md", "Gemfile", "Gemfile.lock", "Manifest.txt", "README.md", "Rakefile", "ar2json.gemspec", "lib/ar2json.rb", "lib/ar2json/railtie.rb", "lib/ar2json/to_json.rb", "test/helper.rb", "test/test_ar2json.rb", "test/test_performance.rb", ".gemtest"]
  s.homepage = %q{http://github.com/cesario/ar2json}
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{ar2json}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{ar2json provides a `to_json` method on an ActiveRecord::Relation object}
  s.test_files = ["test/test_ar2json.rb", "test/test_performance.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_development_dependency(%q<hoe>, [">= 2.9.4"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<hoe>, [">= 2.9.4"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<hoe>, [">= 2.9.4"])
  end
end
