module ProjectsHelper
  def project_status_options
    Project.statuses.keys.map do |key|
      [key.humanize, key]
    end
  end
end
