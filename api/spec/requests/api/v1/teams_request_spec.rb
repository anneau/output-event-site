require 'rails_helper'

RSpec.describe 'Api::V1::Teams', type: :request do
  let(:parsed_body) { JSON.parse(response.body) }
  before { create_list(:user, 3) }

  describe '#index' do
    subject { get api_v1_teams_path }

    it_behaves_like 'ステータスを返す', 200
    it '指定したデータが取得できる' do
      subject
      expect(parsed_body.length).to eq 3
      expect(parsed_body[0].keys).to eq %w[id name points_count likes_count items_count rank users]
      expect(parsed_body[0]['users'][0].keys).to eq %w[id name points_count likes_count items_count]
    end
  end
end
