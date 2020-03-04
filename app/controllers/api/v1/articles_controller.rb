class Api::V1::QuotesController < ApplicationController
    before_action :check_login, only: [:create, :index, :show, :update, :destroy]
    before_action :check_owner, only: [:update, :destroy, :show]
    
    def create
        article = current_user.articles.build(article_params)
        article.user_id = current_user.id
        if article.save
            render json: QuoteSerializer.new(article).serializable_hash, status: :created
        else
            render json: { errors: article.errors }, status: :unprocessable_entity
        end
    end
    
    def show
        options = { include: [:user] }
        render json: QuoteSerializer.new(@article, options).serializable_hash
    end

    def index
        @articles = current_user.articles.all
        if @articles
            render json: QuoteSerializer.new(@articles).serializable_hash
        else
            render json: { errors: article.errors }, status: :unprocessable_entity
        end
    end

    def update
        if @article.update(quote_params)
            render json: QuoteSerializer.new(@article).serializable_hash
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
        params.require(:article).permit(:title, :text, :page_id, :wiki_url)
    end

    def check_owner
        head :forbidden unless @article.user_id == current_user&.id
    end
    
end