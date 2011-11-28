class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    logger.debug 'before hash assignment'
    omniauth = request.env["omniauth.auth"]
    logger.debug 'before debug'
    logger.debug ['provider: ?, uid: ?', omniauth['provider'], omniauth['uid']]
    logger.debug 'before authentication db search'
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    logger.debug 'before if'
    if authentication
      logger.debug 'authentication'
      flash[:notice] = "You signed in."
      session[:user_id] = authentication.user_id
    elsif current_user
      logger.debug 'current_user'
      current_user.authentications.create(:provider => omniauth['provider'], :uid => omniauth['uid'])  
      flash[:notice] = "Added new sign in method."
    else
      logger.debug 'before new user'
      user = User.new
      logger.debug 'before build'
      user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
      logger.debug 'before save'
      user.save!
      logger.debug 'before flash'
      flash[:notice] = "Account created."
      logger.debug 'before session'
      session[:user_id] = user.id
    end
    logger.debug 'before redirect'
    redirect_to authentications_url
  end

  def destroy
    remaining_authentications = current_user.authentications.count(:all, :conditions => ["id <> ?", params[:id]])
    if remaining_authentications > 0
      @authentication = current_user.authentications.find(params[:id])
      @authentication.destroy
      flash[:notice] = "Removed sign in method."
    else
      flash[:error] = "You cannot remove a sign in method if you don't have any other methods.  Please add another method before removing this one."
    end
    redirect_to authentications_url
  end
end
