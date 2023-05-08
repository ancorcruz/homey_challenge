module Projects
  class Update
    def self.call(...)
      new(...).call
    end

    def initialize(project:, project_params:)
      @project = project
      @project_params = project_params
    end

    def call
      project.transaction do
        project.update(project_params).tap do |updated|
          if updated && project.status_previously_changed?
            status_change = project.status_changes.create!(
              previous_status: project.status_previously_was,
              new_status: project.status
            )
            project.activities.create! trackable: status_change
          end
        end
      end
    rescue
      false
    end

    private

    attr_reader :project, :project_params
  end
end
