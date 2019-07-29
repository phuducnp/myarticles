module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        articles = Article.all
        render json: { status: :success, message: 'Loaded articles', data: articles }
      end

      def show
        article
        render json: { status: :success, message: 'Loaded article', data: article }
      end

      def create
        article = Article.create(article_params)
        return render json: { status: :success, message: 'Saved article', data: article } if article.save

        render json: { status: :error, message: 'Article not saved', data: article.errors },
          status: :unprocessable_entity
      end

      def update
        article
        if article.update_attributes(article_params)
          render json: { status: :success, message: 'Updated article', data: article }
        else
          render json: { status: :error, message: 'Article not updated', data: article.errors },
            status: :unprocessable_entity
        end
      end

      def destroy
        article
        if article.destroy
          render json: { status: :success, message: 'Deleted article', data: article }
        else
          render json: { status: :error, message: 'Article not deleted', data: article.errors },
            status: :unprocessable_entity
        end
      end

      private
      def article_params
        params.permit(:title, :body)
      end

      def article
        article = Article.find_by(id: params[:id])
      end
    end
  end
end