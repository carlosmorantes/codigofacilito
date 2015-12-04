class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, except: [:show,:index] # devise (callback) tiene por defecto este helper para ser usado en los controladores, en vez de lo anterior
	before_action :set_article, except: [:index, :new, :create] # Callback muy popular

	#GET /articles
	def index
		@articles = Article.all
	end
	#GET /articles/:id
	def show
	  @article.update_visits_count	
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

	end

	#PUT /articles/:id
	def update	  
	  if @article.update(articles_params)
	    redirect_to @article	
	  else
	  	render :edit
	  end	
	end

	#DELETE /articles/:id
	def destroy
		@article.destroy # elimina objeto de la BD
		redirect_to articles_path # index	
	end

	private

	#def validate_user
	#	redirect_to new_user_session_path, notice: "Necesitas iniciar sesión"
	#end

	def set_article
      @article = Article.find(params[:id])
	
	end

	def articles_params # nombre por convecion
	  params.require(:article).permit(:title,:body)	# objeto params, aqui no es permitido visit_counts. El nivel mas alto es el article
	end
end