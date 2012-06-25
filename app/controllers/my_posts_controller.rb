class MyPostsController < ApplicationController

  def post_index

    @my_posts = MyPost.paginate(:page => params[:page], :per_page => 7)

  end

  def post_add

    @my_post = MyPost.new()
    @url = post_create_my_posts_path
  end

  def post_create

    @my_post = MyPost.new(params[:my_post])
    @url = post_create_my_posts_path

      if  @my_post.save
         redirect_to root_path, :notice => 'User was successfully added!!!'
      else
         render :action => "post_add"
      end

  end

  def post_show

    @my_post = MyPost.find(params[:id])
    @comments = @my_post.comments.all


  end

  def post_edit

    @my_post = MyPost.find(params[:id])
    logger.info @my_post.inspect
    @url = post_update_my_post_path

  end

  def post_update

    @my_post = MyPost.find(params[:id])
    @url = post_update_my_post_path


    if  @my_post.update_attributes(params[:my_post])
         redirect_to post_show_my_post_path, :notice => 'Post was successfully updated!!!'
      else
         render :action => "post_edit"
      end



  end


  def post_delete

    @my_post = MyPost.find(params[:id])
    @my_post.destroy()

    redirect_to root_path
  end

  def add_comment
    @my_post = MyPost.find(params[:id])


    @comment = @my_post.comments.new(:comment => params[:text])
    @comment.save
    @comments = @my_post.comments.all
    logger.info @comments.inspect

    respond_to do |format|
      format.js
    end

    end



  #def delete_comment
  #  @my_posts = MyPost.find(params[:id])
  #  @comment = @my_posts.comments.all
  #  @comments = @comments.find(params[:id])
  #
  #  if @comments.destroy()
  #    render :action => "post_show"
  #  else
  #    puts "hiiii"
  #  end
  #end


end




