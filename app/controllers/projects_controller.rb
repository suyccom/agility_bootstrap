class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
    @project = find_instance
    @stories = @project.stories.apply_scopes(
      :search    => [params[:search], :title],
      :status_is => params[:status],
      :order_by  => parse_sort_param(:title, :status))
  end
  
  def create
    hobo_create do
      if request.xhr?
        @this = Story.new(:project => @project) 
      else
        create_response
      end
    end
  end


end
