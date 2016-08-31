module ForemanAnsibleExporter
  class Exporter
    attr_reader :roles_dir

    def initialize(roles_dir)
      @roles_dir = roles_dir
    end
  end
end
