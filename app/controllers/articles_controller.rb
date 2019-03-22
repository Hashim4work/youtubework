class ArticlesController < ApplicationController
	
	helper ArticlesHelper

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
	before_action :params_find, only: [:show, :edit, :update, :destroy]
	def index
		@articles = Article.all
		@articles = @articles.sort_by {|article| article.created_at }
	end

	def new
		 @article = Article.new
	end

	def create
		@article = Article.new(params_article)

		if @article.save
			flash[:notice] = "Successfully created product."
			redirect_to @article
		else
			render new_article_path
		end

	end

	def edit
	end

	def update
		if @article.update(params_article)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy

		redirect_to articles_path
	end
	def show
	end

	private
	def params_find
		@article = Article.find(params[:id])
	end

	def params_article
		params.require(:article).permit(:title, :text)
	end
 
end
