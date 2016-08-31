require 'foreman_ansible_exporter/exporter'
require 'fileutils'

module ForemanAnsibleExporter
  class FilesExporter < Exporter
    attr_reader :filepath

    def initialize(roles_dir, role_name, dir, file_name)
      super(roles_dir)
      @filepath = "#{roles_dir}/#{role_name}/#{dir}/#{file_name}"
    end

    def export_file
      { :content => File.read(filepath) }
    end

    def write_file(content)
      File.write(filepath, content)
      { :file => filepath, :file_written => true }
    end

    def delete_file
      FileUtils.rm(filepath)
      { :file => filepath, :deleted => true }
    end
  end
end
