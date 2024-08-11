# ApplicationControllerを継承している
class PostsController < ApplicationController
    before_action :set_post, only: [ :edit, :update, :destroy ] # edit, update, destroyの前にset_postを実行
    def index
        @posts = Post.all # Post：モデル名, @posts：インスタンス変数
    end

    def new # 新しく投稿するためのフォーム
        @post = Post.new # オブジェクトの作成
    end

    def create # 投稿を保存するためのアクション
        @post = Post.new(post_params) # パラメータを受け取る title, content
        if @post.save # 保存できたら
            redirect_to posts_path # 一覧画面にリダイレクト. /posts
        else
            render :new # エラーがあれば，new.html.erbを表示 -> 新しい投稿フォーム
        end
    end

    def edit
    end

    def update
        if @post.update(post_params) # 更新できたら
            redirect_to posts_path # 一覧画面にリダイレクト
        else
            render :edit # エラーがあれば，edit.html.erbを表示 -> 編集フォーム
        end
    end

    def destroy
        @post.destroy # 削除
        redirect_to posts_path # 一覧画面にリダイレクト
    end

    private # この下はprivateメソッドとなる -> 他のクラスから呼び出せない

    def post_params
        # postの中のtitle, contentのみを許可
        params.require(:post).permit(:title, :content)
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
