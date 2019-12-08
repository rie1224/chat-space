require 'rails_helper'

describe ChatsController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe 'GET #index' do

    context 'log in' do
      before do 
        login user
        get :index, params: { group_id: group.id }
      end

      it "assings @chat" do
        expect(assigns(:chat)).to be_a_new(Chat)
      end

      it "assigns @group" do
        expect(assigns(:group)).to eq group
      end

      it "renders the :index templete" do
      expect(response).to render_template :index
      end
    end

    context "not log in" do
      before do 
        get :index, params: { group_id: group.id }
      end

      it "redirects to new_user_session_path " do
        expect(response).to redirect_to(new_user_session_path)
      end
    end  
  end

describe 'POST #create' do
  
  context ''

end


