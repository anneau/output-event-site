class Api::V1::TeamsController < ApplicationController
  def index
    @teams = Team.order(rank: :asc)
    render json: @teams, each_serializer: Api::V1::TeamSerializer
  end
end
