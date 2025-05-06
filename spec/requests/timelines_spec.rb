require 'rails_helper'

RSpec.describe 'Timelines', type: :request do
  let!(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET /timelines' do
    it '200ステータスが返ってくる' do
      get timeline_path
      expect(response).to have_http_status(200)
    end
  end
end
