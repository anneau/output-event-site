require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    subject(:user) { build(:user) }

    context '正常な値の場合' do
      it 'バリデーションが通る' do
        is_expected.to be_valid
      end
    end

    context '異常な値の場合' do
      before { user.valid? }

      context 'nameの値がnullのとき' do
        let(:user) { build(:user, name: nil) }
        it 'バリデーションが通らない' do
          expect(user.errors.messages[:name]).to include("can't be blank")
        end
      end

      context 'qiitas_idの値がnullのとき' do
        let(:user) { build(:user, qiitas_id: nil) }
        it 'バリデーションが通らない' do
          expect(user.errors.messages[:qiitas_id]).to include("can't be blank")
        end
      end
    end
  end
end
