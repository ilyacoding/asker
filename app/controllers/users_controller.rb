class UsersController < ApplicationController
  def index
    raise CanCan::AccessDenied if current_user.blank?

    @users = User.all
  end

  def make_admin
    find_and_clean_user.add_role :admin
    redirect_to_index
  end

  def make_moderator
    find_and_clean_user.add_role :moderator
    redirect_to_index
  end

  def make_member
    find_and_clean_user.add_role :member
    redirect_to_index
  end

  private

  def find_and_clean_user
    User.find(params[:user_id]).tap do |user|
      user.roles = []
    end
  end

  def redirect_to_index
    redirect_to users_path
  end
end
