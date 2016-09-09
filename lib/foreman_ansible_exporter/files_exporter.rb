require 'foreman_ansible_exporter/exporter'
require 'fileutils'

module ForemanAnsibleExporter
  class FilesExporter < Exporter
    def filepath(role_name, dir, file_name)
      "#{roles_dir}/#{role_name}/#{dir}/#{file_name}"
    end

    def file(role_name, dir, file_name)
      path = filepath role_name, dir, file_name
      content = File.read path
      { :content =>  content }.with_indifferent_access
    rescue => e
      raise Error, "Could not read file #{path}, cause: #{e.message}"
    end

    def write_file(role_name, dir, file_name, content)
      path = filepath role_name, dir, file_name
      File.write(path, content)
      { :file => path, :file_written => true }.with_indifferent_access
    rescue => e
      raise Error, "Could not write file #{path}, cause: #{e.message}"
    end

    def delete_file(role_name, dir, file_name)
      path = filepath role_name, dir, file_name
      FileUtils.rm(path)
      { :file => path, :deleted => true }.with_indifferent_access
    rescue => e
      raise Error, "Could not delete file #{path}, cause: #{e.message}"
    end

    alias_method :update_file, :write_file
    alias_method :create_file, :write_file
  end
end
