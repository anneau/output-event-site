require 'rails_helper'
require 'rake'

describe 'user:update' do
  subject(:task) { Rake.application['user:update'] }
  let!(:user) { create(:hata) }

  it '正常にuserが更新できる' do
    last_updated_items_count = user.items_count

    # TODO: とりあえずタスクが動くのを確認するために記述したので要修正
    expect { task.invoke }.to change { user.reload.items_count }.from(last_updated_items_count).to 0
  end
end
