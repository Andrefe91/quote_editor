class ApplicationController < ActionController::Base
  #Authenticate the user everywhere in the application, except the sign up/sign in logic page.
  before_action :authenticate_user!, unless: :devise_controller?
end
