class CommentsController < SecretsController

  def create
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.task = @task
    if @comment.save
      redirect_to :back, notice: "Comment was successfully posted!"
    else
      # flash.now[:alert] = "There was a problem posting your comment."
      redirect_to :back
    end
  end


private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
