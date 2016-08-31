$:.push File.expand_path("../lib", __FILE__)

require "foreman_ansible_exporter/version"

Gem::Specification.new do |gem|
  gem.name                  = "foreman_ansible_exporter"
  gem.authors               = ["Foreman Ansible Team"]
  gem.files                 = %w(LICENSE README.md Rakefile) + Dir["lib/**/*"]
  gem.require_paths         = ["lib"]
  gem.version               = ForemanAnsibleExporter::VERSION

  gem.add_development_dependency 'rake'
end
