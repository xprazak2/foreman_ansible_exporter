$:.push File.expand_path("../lib", __FILE__)

require "foreman_ansible_exporter/version"

Gem::Specification.new do |s|
  s.name                  = "foreman_ansible_exporter"
  s.summary               = "Exports Ansible roles"
  s.authors               = ["Foreman Ansible Team"]
  s.files                 = %w(LICENSE README.md Rakefile) + Dir["lib/**/*"]
  s.require_paths         = ["lib"]
  s.version               = ForemanAnsibleExporter::VERSION

  s.add_development_dependency 'rake'
end
