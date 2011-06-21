# encoding: utf-8
begin
  require 'hoe'
  require 'json'
rescue LoadError => e
  raise "Please install the required gem: #{e.message}"
end

Hoe.plugin :gemspec

Hoe.spec 'ar2json' do
  developer('Franck Verrot', 'franck@verrot.fr')
  self.readme_file       = 'README.md'
  self.history_file      = 'CHANGELOG.md'
  self.dependency          'activerecord', '>= 3.0.0'
  self.testlib           = :minitest
end

desc "Cultivate"
task :cultivate do
  system "touch Manifest.txt; rake check_manifest | grep -v \"(in \" | patch"
  system "rake debug_gem | grep -v \"(in \" > `basename \\`pwd\\``.gemspec"
end
