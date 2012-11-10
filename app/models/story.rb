class Story < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title  :string, :required
    notes  :string, :required
    place  :string, :required
    description :string
    body   :markdown
    timestamps
  end
  attr_accessible :title, :status_id, :status, :place, :notes, :description, :body, :project_id

  belongs_to :project
  
  belongs_to :status, :class_name => "StoryStatus"

  has_many :tasks, :dependent => :destroy, :order => :position

  children :tasks

  # --- Permissions --- #

  def create_permitted?
    true#project.creatable_by?(acting_user)
  end

  def update_permitted?
    project.updatable_by?(acting_user)
  end

  def destroy_permitted?
    project.destroyable_by?(acting_user)
  end

  def view_permitted?(field)
    true#project.viewable_by?(acting_user)
  end

end
