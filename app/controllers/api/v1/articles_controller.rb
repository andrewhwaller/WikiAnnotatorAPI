class Api::V1::ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy]
    before_action :check_login, only: [:create, :index, :show, :update, :destroy]
    before_action :check_owner, only: [:update, :destroy, :show]
    
    def create
        article = current_user.articles.build(article_params)
        article.user_id = current_user.id
        if article.save
            render json: ArticleSerializer.new(article).serializable_hash, status: :created
        else
            render json: { errors: article.errors }, status: :unprocessable_entity
        end
    end
    
    def show
        options = { include: [:user] }
        render json: ArticleSerializer.new(@article, options).serializable_hash
    end

    def index
        @articles = current_user.articles.all
        if @articles
            render json: ArticleSerializer.new(@articles).serializable_hash
        else
            render json: { errors: article.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(article_params)
            render json: ArticleSerializer.new(@article).serializable_hash
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        head 204
    end
      
    private

    def article_params
        params.require(:article).permit(:title, :extract, :pageid)
    end

    def check_owner
        head :forbidden unless @article.user_id == current_user&.id
    end

    def set_article
        @article = Article.find(params[:id])
    end
    
end