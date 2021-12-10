class MainController < ApplicationController
    def index
    @blogs = Blog.all
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
      params.require(:blog).permit(:title, :body)
    end
end