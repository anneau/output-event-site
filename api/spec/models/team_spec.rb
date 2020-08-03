require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'バリデーションチェック' do
    subject(:team) { build(:team) }

    context '正常な値の場合' do
      it 'バリデーションが通る' do
        is_expected.to be_valid
      end
    end

    context '異常な値の場合' do
      before { team.valid? }

      context 'nameの値がnullのとき' do
        let(:team) { build(:team, name: nil) }
        it 'バリデーションが通らない' do
          expect(team.errors.messages[:name]).to include("can't be blank")
        end
      end
    end
  end
end
