class MyPostController < ApplicationController

  def post_index

    @my_posts = MyPost.paginate(:page => params[:page], :per_page => 7)

  end

  def post_add

    @my_post = MyPost.new()
    @url = post_create_my_post_index_path

  end

  def post_create

    @my_post = MyPost.new(params[:my_post])
    @url = post_create_my_post_index_path

      if  @my_post.save
         redirect_to root_path, :notice => 'User was successfully added!!!'
      else
         render :action => "post_add"
      end

  end

  def post_show

    @my_post = MyPost.find(params[:id])

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
         redirect_to post_show_my_post_path, :notice => 'User was successfully updated!!!'
      else
         render :action => "post_edit"
      end



  end


  def post_delete

    @my_post = MyPost.find(params[:id])
    @my_post.destroy()

    redirect_to root_path
  end

end




