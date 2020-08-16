class Api::V1::TeamsController < ApplicationController
  before_action :set_team, only: %i[update]
  def index
    @teams = Team.all.order(points_count: 'DESC')
    render json: @teams, each_serializer: Api::V1::TeamSerializer
  end

  def create
    @team = Team.create!(permitted_team_params)
    render json: @team, status: :created
  end

  def update
    @team.update!(permitted_team_params)
    render json: @team
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def permitted_team_params
    params.permit(:id, :name, :points_count, :likes_count, :items_count)
  end
end
