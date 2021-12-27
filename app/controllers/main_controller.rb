class MainController < ApplicationController
    def index
        if Current.user
            @user = User.find_by(id: Current.user.id)       
         @blogs = @user.blogs
        else
         redirect_to  user_index_path
        end
    end

    def new
      @blog =Blog.new  
    end

    def create 

        # render plain: params #to view parama send from view

        @blog =Blog.new(blog_params)

        if @blog.save 
            redirect_to blog_path          
        else
            render :new
        end
    end

    def edit
        # @blog =Blog.new  
        # render plain: params
        @blog = Blog.find(params[:id])
        # @users= @blog.user
    end

    def update
        # render plain: params
        @blog = Blog.find(params[:id])

        

        if @blog.update(blog_params)
            redirect_to :blog
        else
            render :edit
        end

    end

    def destroy
        Blog.destroy(params[:id])
        redirect_to :blog
    end

    private
    def blog_params
      params.require(:blog).permit(:title, :body, :status,images: []).merge(user_id: Current.user.id)
    end
end