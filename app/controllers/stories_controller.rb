class StoriesController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :project, [:new, :create]

  def new_1_column
    hobo_new { render 'new_1_column' }
  end
  
  def new_2_column
    hobo_new { render 'new_2_column' }
  end
  
  def new_3_column
    hobo_new { render 'new_3_column' }
  end
  
  def new_aside
    hobo_new { render 'new_aside' }
  end
  
  def new_2_column_aside
    hobo_new { render 'new_2_column_aside' }
  end
  
  def new_3_column_aside
    hobo_new { render 'new_3_column_aside' }
  end
  
  def new_double_size_field
    hobo_new { render 'new_double_size_field' }
  end

end
