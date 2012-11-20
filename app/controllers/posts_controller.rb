class PostsController < ApplicationController
  # inherit_resources

  helper_method :resource
  helper_method :collection


  respond_to :html

  def create
    @resource = Post.new params[:post]
    if @resource.save
      redirect_to @resource and return
    else
      render :new and return
    end
  end

  def resource
    @resource ||= find_resource or build_resource
  end


  def build_resource
    collection.build(resource_params)
  end

  def collection
    Post.scoped
  end


  def find_resource
    if params[:id]
      collection.find(params[:id])
    end
  end


  def resource_params
    params[:post]||{}
  end

end
