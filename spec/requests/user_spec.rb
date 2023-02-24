require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #login' do
    let!(:user) { create(:user, user_name: 'testuser') }

    context 'when user exists' do
      it 'returns status code 200' do
        post :login, params: { username: 'testuser' }
        expect(response).to have_http_status(200)
      end

      it 'returns user information' do
        post :login, params: { username: 'testuser' }
        expect(JSON.parse(response.body)['data']['id']).to eq(user.id)
        expect(JSON.parse(response.body)['data']['name']).to eq(user.name)
        expect(JSON.parse(response.body)['data']['user_name']).to eq(user.user_name)
      end
    end

    context 'when user does not exist' do
      it 'returns status code 403' do
        post :login, params: { username: 'nonexistentuser' }
        expect(response).to have_http_status(403)
      end

      it 'returns an error message' do
        post :login, params: { username: 'nonexistentuser' }
        expect(JSON.parse(response.body)['message']).to eq('Login failure,User does not exist.')
      end
    end
  end

  describe 'POST #register' do
    context 'when valid parameters are provided' do
      it 'creates a new user' do
        expect do
          post :register, params: { name: 'Test User', username: 'testuser' }
        end.to change(User, :count).by(1)
      end

      it 'returns status code 201' do
        post :register, params: { name: 'Test User', username: 'testuser' }
        expect(response).to have_http_status(201)
      end

      it 'returns the created user information' do
        post :register, params: { name: 'Test User', username: 'testuser' }
        expect(JSON.parse(response.body)['data']['name']).to eq('Test User')
        expect(JSON.parse(response.body)['data']['user_name']).to eq('testuser')
      end
    end

    context 'when invalid parameters are provided' do
      it 'does not create a new user' do
        expect do
          post :register, params: { name: '', username: 'testuser' }
        end.not_to change(User, :count)
      end

      it 'returns status code 400' do
        post :register, params: { name: '', username: 'testuser' }
        expect(response).to have_http_status(400)
      end

      it 'returns an error message' do
        post :register, params: { name: '', username: 'testuser' }
        expect(JSON.parse(response.body)['message']).to eq('Bad request.')
      end
    end

    context 'when an error occurs during user creation' do
      before do
        allow_any_instance_of(User).to receive(:save).and_return(false)
      end

      it 'does not create a new user' do
        expect do
          post :register, params: { name: 'Test User', username: 'testuser' }
        end.not_to change(User, :count)
      end

      it 'returns status code 500' do
        post :register, params: { name: 'Test User', username: 'testuser' }
        expect(response).to have_http_status(500)
      end

      it 'returns an error message' do
        post :register, params: { name: 'Test User', username: 'testuser' }
        expect(JSON.parse(response.body)['message']).to eq('Something went wrong please try again later.')
      end
    end
  end
end
