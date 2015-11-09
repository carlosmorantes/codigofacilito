class ArticlesController < ApplicationController
	#GET /articles
	def index
		@articles = Article.all
	end
	#GET /articles/:id
	def show
      @article = Article.find(params[:id])
	end

	#GET /articles/new
	def new
      @article = Article.new
	end
	#POST /articles
	def create
		@article = current_user.articles.new(articles_params)
		
		if @article.save
		  redirect_to @article
		else
		  render :new
		end    
	end

	#GET /articles/:id/edit
	def edit
	  @article = Article.find(params[:id])	  

	end

	#PUT /articles/:id
	def update
	  @article = Article.find(params[:id])
	  
	  if @article.update(articles_params)
	    redirect_to @article	
	  else
	  	render :edit
	  end	
	end

	#DELETE /articles/:id
	def destroy
		@article = Article.find(params[:id])
		@article.destroy # elimina objeto de la BD

		redirect_to articles_path # index	
	end

	private

	def articles_params # nombre por convecion
	  params.require(:article).permit(:title,:body)	# objeto params, aqui no es permitido visit_counts. El nivel mas alto es el article
	end
end