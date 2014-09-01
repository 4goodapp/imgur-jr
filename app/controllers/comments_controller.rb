class CommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    @comment.update(user_id: current_user.id)

    if @comment.save
      redirect_to @photo
    else
      @comments = @photo.comments
      render 'photos/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :photo_id, :user_id)
  end

end
