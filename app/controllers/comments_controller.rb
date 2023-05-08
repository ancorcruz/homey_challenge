class CommentsController < ApplicationController
  before_action :set_project, only: :create

  # POST /comments
  def create
    @comment = @project.comments.new(comment_params)

    if @comment.save
      redirect_to @project, notice: "Comment was successfully created."
    else
      render @project, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
