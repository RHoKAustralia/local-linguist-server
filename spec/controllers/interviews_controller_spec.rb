require 'rails_helper'

RSpec.describe InterviewsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InterviewsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:interview_json) {
    <<-EOF
{"interview":{"id":0,"interview_time":"/Date(1471342088000-0000)/","interviewee_id":0,"interviewer_id":0,"locale_id":0,"recordings":[{"id":0,"interview_id":0,"language_id":0,"phrase_id":3,"text_response":"popcorn"},{"audio_url":"4db714479d404359ae07deeeef67f116.mp4","id":0,"interview_id":0,"language_id":0,"phrase_id":4},{"audio_url":"71831ac0047842418b0b8b843e50b5d0.mp4","id":0,"interview_id":0,"language_id":0,"phrase_id":5},{"audio_url":"0e8daa17b7e545faa48b5e1b1fbac1ee.mp4","id":0,"interview_id":0,"language_id":0,"phrase_id":6,"text_response":"eh ore"},{"audio_url":"2676a994c3714b4baa0f705ca1fb4775.mp4","id":0,"interview_id":0,"language_id":0,"phrase_id":7,"text_response":"leggings"},{"audio_url":"03811859423f42c8a746a277531c6a06.mp4","id":0,"interview_id":0,"language_id":0,"phrase_id":8,"text_response":"sunny side"},{"id":0,"interview_id":0,"language_id":0,"phrase_id":9,"text_response":"ent"},{"id":0,"interview_id":0,"language_id":0,"phrase_id":1,"text_response":"bazza"},{"id":0,"interview_id":0,"language_id":0,"phrase_id":2,"text_response":"chick"}],"study_id":1},"interviewee":{"age":20,"education_level":"Universidade","firstLanguage":"Baikenu","gender":"Mane","id":0,"livedWholeLife":true,"livesInDistrict":"Dom Aleixo","livesInMunicipality":"Dili","livesInVillage":"Fatuhada","name":"squire","occupation":"Mestre / Mestra"}}
    EOF
  }

  describe 'POST #upload' do
    it 'works' do
      post :upload, interview_json, valid_session
      expect(response.code).to eq(200)
    end
  end

  describe "GET #index" do
    it "assigns all interviews as @interviews" do
      interview = Interview.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:interviews)).to eq([interview])
    end
  end

  describe "GET #show" do
    it "assigns the requested interview as @interview" do
      interview = Interview.create! valid_attributes
      get :show, {:id => interview.to_param}, valid_session
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe "GET #new" do
    it "assigns a new interview as @interview" do
      get :new, {}, valid_session
      expect(assigns(:interview)).to be_a_new(Interview)
    end
  end

  describe "GET #edit" do
    it "assigns the requested interview as @interview" do
      interview = Interview.create! valid_attributes
      get :edit, {:id => interview.to_param}, valid_session
      expect(assigns(:interview)).to eq(interview)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Interview" do
        expect {
          post :create, {:interview => valid_attributes}, valid_session
        }.to change(Interview, :count).by(1)
      end

      it "assigns a newly created interview as @interview" do
        post :create, {:interview => valid_attributes}, valid_session
        expect(assigns(:interview)).to be_a(Interview)
        expect(assigns(:interview)).to be_persisted
      end

      it "redirects to the created interview" do
        post :create, {:interview => valid_attributes}, valid_session
        expect(response).to redirect_to(Interview.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved interview as @interview" do
        post :create, {:interview => invalid_attributes}, valid_session
        expect(assigns(:interview)).to be_a_new(Interview)
      end

      it "re-renders the 'new' template" do
        post :create, {:interview => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested interview" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => new_attributes}, valid_session
        interview.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested interview as @interview" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
        expect(assigns(:interview)).to eq(interview)
      end

      it "redirects to the interview" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => valid_attributes}, valid_session
        expect(response).to redirect_to(interview)
      end
    end

    context "with invalid params" do
      it "assigns the interview as @interview" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => invalid_attributes}, valid_session
        expect(assigns(:interview)).to eq(interview)
      end

      it "re-renders the 'edit' template" do
        interview = Interview.create! valid_attributes
        put :update, {:id => interview.to_param, :interview => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested interview" do
      interview = Interview.create! valid_attributes
      expect {
        delete :destroy, {:id => interview.to_param}, valid_session
      }.to change(Interview, :count).by(-1)
    end

    it "redirects to the interviews list" do
      interview = Interview.create! valid_attributes
      delete :destroy, {:id => interview.to_param}, valid_session
      expect(response).to redirect_to(interviews_url)
    end
  end

end
