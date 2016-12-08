require 'rails_helper'

describe ReviewsController do
=begin
  describe 'GET #index' do

    it 'populates an array of all reviews' do
      review1 = create(:review)
      review2 = create(:review)
      review3 = create(:review)
      get :index
      expect(assigns(:reviews)).to match_array(reviews)
    end

    it 'renders the :index template' do
      expect(response).to render_template :index
    end
  end
=end

  describe 'GET #show' do

  end

  describe 'GET #new' do
    it 'assigns new review to @review'
    it 'renders :new template'
  end

  describe 'GET #edit' do
    it 'it renders :edit template'
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves new review in database'
      it 'redirects to restaurant#show'
    end

    context 'with invalid attributes' do
      it 'does not save new review in database'
      it 're-renders the :new template'
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the review in database'
      it 'redirects to restaurant #show'
    end

    context 'with invalid attributes' do
      it 'does not update the review in database'
      it 're-renders :edit template'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes review from database'
    it 'redirects to restaurant#show'
  end

end
