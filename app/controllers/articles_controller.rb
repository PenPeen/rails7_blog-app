class ArticlesController < ApplicationController

    # 記事の一覧表示
    def index
        binding.pry
        @articles = Article.all
    end

    # 記事の詳細表示
    def show
        @article = Article.find(params[:id])
    end

    # 記事の作成画面
    def new
        @article = Article.new
    end

    #　記事の作成処理
    def create
        Article.create(article_params)
        redirect_to articles_path
    end

    # 記事の編集
    def edit
        @article = Article.find(params[:id])
    end

    # 記事の更新
    def update
        @article = Article.find(params[:id])
        @article.update(article_params);

        redirect_to articles_path
    end

    # 記事削除
    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path, status: :see_other
    end

    #　ストロングパラメータ
    private
        def article_params
            params.require('article').permit('title', 'body');
        end
end
