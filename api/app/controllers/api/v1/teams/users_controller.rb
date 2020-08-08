class Api::V1::Teams::UsersController < ApplicationController
  before_action :set_user, only: %i[update]
  before_action :set_team, only: %i[update]

  def update
    @user.update!(permitted_user_params)
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def permitted_user_params
    params.permit(:id, :name, :points_count, :likes_count, :items_count)
  end
end
