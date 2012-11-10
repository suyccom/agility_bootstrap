# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

AgilityBootstrap::Application.routes.draw do


  # Resource routes for controller story_statuses
  resources :story_statuses, :only => [:index, :new, :create, :update, :destroy]


  # Resource routes for controller stories
  resources :stories, :only => [:new, :edit, :show, :create, :update, :destroy]

  # Owner routes for controller stories
  resources :projects, :as => :project, :only => [] do
    resources :stories, :only => [] do
      get 'new', :on => :new, :action => 'new_for_project'
      collection do
        post 'create', :action => 'create_for_project'
      end
    end
  end


  # Resource routes for controller projects
  resources :projects


  # Resource routes for controller tasks
  resources :tasks, :only => [:edit, :create, :update, :destroy] do
    collection do
      post 'reorder'
    end
  end

  # Owner routes for controller tasks
  resources :stories, :as => :story, :only => [] do
    resources :tasks, :only => [] do
      collection do
        post 'create', :action => 'create_for_story'
      end
    end
  end


  # Resource routes for controller users
  resources :users, :only => [:edit, :show, :create, :update, :destroy] do
    collection do
      get 'complete_name'
      post 'signup', :action => 'do_signup'
      get 'signup'
    end
    member do
      get 'account'
      put 'activate', :action => 'do_activate'
      get 'activate'
      put 'reset_password', :action => 'do_reset_password'
      get 'reset_password'
    end
  end

  # User routes for controller users
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'


  # Resource routes for controller project_memberships
  resources :project_memberships, :only => [:create, :update, :destroy]

end
