require 'rails_helper'

RSpec.describe 'Api::V1::Teams::Users', type: :request do
  describe '#update' do
    subject { patch api_v1_team_user_path(team_id, user_id), params: params }
    let!(:users) { create_list(:user, 3) }
    let(:user) { create(:user) }

    context '正常にuserが更新できる場合' do
      let(:params) { { name: 'edited_user_name' } }
      let(:team_id) { user.team_id }
      let(:user_id) { user.id }

      it 'userのnameが変わる' do
        unedited_users_name = user.name
        expect { subject }.to change { user.reload.name }.from(unedited_users_name).to params[:name]
      end
      it_behaves_like 'ステータスを返す', 200
    end

    context 'userが更新できない場合' do
      context 'nameが空文字列の場合' do
        let(:team_id) { user.team_id }
        let(:user_id) { user.id }
        let(:params) { { name: '' } }

        it_behaves_like 'ステータスを返す', 400
      end

      context 'パラメータで指定したuserIDがレコードに存在しないとき' do
        let(:team_id) { user.team_id }
        let(:user_id) { 'user_id' }
        let(:params) { { name: 'edited_user_name' } }

        it_behaves_like 'ステータスを返す', 404
      end

      context 'パラメータで指定したteamIDがレコードに存在しないとき' do
        let(:team_id) { 'team_id' }
        let(:user_id) { user.id }
        let(:params) { { name: 'edited_user_name' } }

        it_behaves_like 'ステータスを返す', 404
      end
    end
  end
end
