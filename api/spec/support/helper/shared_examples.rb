# frozen_string_literal: true

shared_examples 'ステータスを返す' do |status|
  it "ステータスコード#{status}を返す" do
    is_expected.to eq status
  end
end
