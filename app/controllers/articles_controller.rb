class ArticlesController < ApplicationController

	before_action :set_article, only: %w(show edit update destroy)

	# テンプレートの設定
	layout 'navBar'

	# 記事一覧(TOP)ページを表示します
	def index
		@articles = Article.all
	end

	# 記事作成ページを表示します
	def new
		# if @article.nil?
		  @article = Article.new
		# else
	 #      @article[] = [:title]
	 #      @article[] = [:content]
		# end
	end

	# 作成した記事をDBに登録します
	def create
		@article = Article.new(article_params)
	    respond_to do |format|
	      if @article.save then
	        format.html { redirect_to articles_path }
	      else
	        # 一度目の「確認」ボタンクリック時は、confirmingがセットされていないのsaveでエラーが発生しこっちに来る
	        # ただし、ここに到達した時点で model の after_validation 後なので、confirmingはセットされている状態で new アクションへ
	        format.html { render action: 'new' }
	      end
	    end
	end

	# 記事ページを表示します
	def show
	end

	# 記事編集ページを表示します
	def edit
	end

	# 編集した記事をDBに登録します
	def update
		if @article.update(article_params) then
			redirect_to articles_path
		else
			render action: 'edit'
		end
	end

	# 記事を削除します
	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private
		# 登録する値を取り出します
		def article_params
			params.require(:article).permit(:title, :content, :confirming)
		end

		# Articleのインスタンスを取得します
		def set_article
			@article = Article.find(params[:id])
		end
end
