# encoding: utf-8

require 'acceptance_helper'
 
describe 'The user can use forms with columns', :type => :acceptance, :driver => :selenium do
 
  before do
    Capybara.default_wait_time = 10
    login
  end
 
  it 'forms without aside' do
    visit '/stories/new_1_column'
    human_check_sizes 'Does it look nice with one column?'
  
    visit '/stories/new_2_column'
    human_check_sizes 'Does it look nice with two columns?'
    
    visit '/stories/new_3_column'
    human_check_sizes 'Does it look nice with three columns?'
  end
  
  
  it 'forms with aside' do
    visit '/stories/new_aside'
    human_check_sizes '¿Se ve bien el aside con una columna?'
  
    visit '/stories/new_2_column_aside'
    human_check_sizes '¿Se ve bien el aside con dos columnas?'
    
    visit '/stories/new_3_column_aside'
    human_check_sizes '¿Se ve bien el aside con tres columnas?'
  end
  
  
  it 'forms with double sized fields' do
    visit '/stories/new_double_size_field'
    human_check_sizes '¿Se ve bien el campo doble de largo?'
  end
  
  
#  PENDING
#  it 'forms with a textearea con un textarea' do
#    visit '/stories/new_with_textarea'
#    human_check_sizes '¿Se ve bien el campo doble de largo?'
#  end
  
  # Show 1,2,3 columnas
  
  
  # Show con aside
 
end
