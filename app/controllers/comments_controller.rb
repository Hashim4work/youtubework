class CommentsController < ApplicationController
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	def new
		@comment = Comment.new
	end
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params_comment)
		if(@comment.save)
			redirect_to article_path(@article)
		else
			render 'comments/error'
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		article = comment.article
		comment.destroy
		redirect_to article_path(article.id)
	end

	private
	def params_comment
		params.require(:comment).permit(:commenter, :body)
	end

end
