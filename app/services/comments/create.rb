module Comments
  class Create
    def self.call(...)
      new(...).call
    end

    def initialize(project:, comment_params:)
      @project = project
      @comment = project.comments.new(comment_params)
    end

    def call
      comment.transaction do
        comment.save.tap do |saved|
          project.activities.create!(trackable: comment) if saved
        end
      end
    rescue
      false
    end

    private

    attr_reader :project, :comment
  end
end
