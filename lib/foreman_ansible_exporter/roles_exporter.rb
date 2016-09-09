require 'foreman_ansible_exporter/exporter'

module ForemanAnsibleExporter
  class RolesExporter < Exporter
    attr_reader :role_folders

    def initialize(roles_dir)
      super(roles_dir)
      @role_folders = %w(tasks meta vars templates handlers defaults files)
    end

    def roles
      roles = all_roles.map do |role_name|
        role_files role_name
      end
      roles.reduce(:merge)
    end

    def all_roles
      list_folders roles_dir
    end

    def role_files(role_name)
      files = role_folders.inject({}) do |memo, folder|
        memo[folder.to_sym] = list_files("#{roles_dir}/#{role_name}/#{folder}")
        memo
      end
      { role_name.to_sym => files }
    end

    def folder_content(folder_name)
      Dir.glob("#{folder_name}/*").map do |path|
        path.split('/').last
      end
    end

    def list_files(folder_name)
      folder_content(folder_name).select { |item| File.file? "#{folder_name}/#{item}"}
    end

    def list_folders(folder_name)
      folder_content(folder_name).select { |item| File.directory? "#{folder_name}/#{item}"}
    end
  end
end
