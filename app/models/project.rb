class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end
  attr_accessible :name, :owner_id

  has_many :stories, :dependent => :destroy

  belongs_to :owner, :class_name => "User", :creator => true
  
  has_many :memberships, :class_name => "ProjectMembership", :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user

  children :stories, :memberships
  
  # --- Permissions --- #

  def create_permitted?
    #owner_is? acting_user
    acting_user.administrator?
  end
 
  def update_permitted?
    acting_user.administrator? || (owner_is?(acting_user) && !owner_changed?)
  end
 
  def destroy_permitted?
     acting_user.administrator? || owner_is?(acting_user)
  end
 
  def view_permitted?(field)
    acting_user.administrator? || acting_user == owner || acting_user.in?(members)
  end
  
end
