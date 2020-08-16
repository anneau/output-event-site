require 'rails_helper'

RSpec.describe 'Api::V1::Teams', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  before { create_list(:user, 3) }

  describe '#index' do
    subject { get api_v1_teams_path }

    it_behaves_like 'ステータスを返す', 200
    it '指定したデータが取得できる' do
      binding.pry

      subject
      expect(parsed_body.length).to eq 3
      expect(parsed_body[0].keys).to eq %w[id name points_count likes_count items_count users]
      expect(parsed_body[0]['users'][0].keys).to eq %w[id name points_count likes_count items_count]
    end
  end

  describe '#create' do
    subject { post api_v1_teams_path, params: params }

    context '正常にteamが作成できる場合' do
      let(:params) { { name: 'team_name' } }

      it_behaves_like 'ステータスを返す', 201
      it 'teamの数が+1される' do
        expect { subject }.to change { Team.count }.by(1)
      end
      it '作成したJSONデータを返す' do
        subject
        expect(parsed_body.keys).to eq %w[id name points_count likes_count items_count users]
      end
    end

    context 'teamが作成できない場合' do
      let(:params) { { name: '' } }

      it_behaves_like 'ステータスを返す', 400
    end
  end

  describe '#update' do
    subject { patch api_v1_team_path(team.id), params: params }
    let(:team) { create(:team) }

    context '正常にteamが更新できる場合' do
      let(:params) { { name: 'edited_team_name' } }

      it 'teamのnameが変わる' do
        unedited_teams_name = team.name
        expect { subject }.to change { team.reload.name }.from(unedited_teams_name).to params[:name]
      end
      it_behaves_like 'ステータスを返す', 200
    end

    context 'teamが更新できない場合' do
      context 'nameが空文字列の場合' do
        let(:params) { { name: '' } }

        it_behaves_like 'ステータスを返す', 400
      end

      context 'パラメータで指定したteamIDがレコードに存在しない時' do
        let(:team) { build(:team, id: Team.ids.max + 1) }
        let(:params) { { name: 'edited_team_name' } }

        it_behaves_like 'ステータスを返す', 404
      end
    end
  end
end
