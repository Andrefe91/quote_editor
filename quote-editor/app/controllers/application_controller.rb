class ApplicationController < ActionController::Base
  #Authenticate the user everywhere in the application, except the sign up/sign in logic page.
  before_action :authenticate_user!, unless: :devise_controller?

  private

  # In ruby, the ||= operator is known as the "conditional assignment operator" or "logical or assignment operator".
  # It is used to assign a value to a variable only if that variable is currently 'nil' or 'false'. If the variable
  # already holds a value other than 'nil' or 'false', the assignment operation does not occur, and the current value
  # of the variable remains unchanged.
  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end

  #Declaring a helper method to use in the whole application
  helper_method :current_company
end
