require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do

  let(:doctor) { create :doctor  }
  let(:patient) { create :patient, ailment: doctor.specialty.ailments.first }

  let(:valid_attributes) {
    attributes_for :appointment, doctor_id: doctor.id, patient_id: patient.id
  }

  let(:invalid_attributes) {
    attributes_for :appointment, doctor_id: nil
  }

  let(:valid_session) { {} }

  let!(:appointment) { create :appointment }

  describe "GET #index" do
    it "assigns all appointments as @appointments" do
      get :index, {}, valid_session
      expect(assigns(:appointments)).to eq([appointment])
    end
  end

  describe "GET #show" do
    it "assigns the requested appointment as @appointment" do
      get :show, {:id => appointment.to_param}, valid_session
      expect(assigns(:appointment)).to eq(appointment)
    end
  end

  describe "GET #new" do
    it "assigns a new appointment as @appointment" do
      get :new, {}, valid_session
      expect(assigns(:appointment)).to be_a_new(Appointment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested appointment as @appointment" do
      get :edit, {:id => appointment.to_param}, valid_session
      expect(assigns(:appointment)).to eq(appointment)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Appointment" do
        expect {
          post :create, {:appointment => valid_attributes}, valid_session
        }.to change(Appointment, :count).by(1)
      end

      it "assigns a newly created appointment as @appointment" do
        post :create, {:appointment => valid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a(Appointment)
        expect(assigns(:appointment)).to be_persisted
      end

      it "redirects to the created appointment" do
        post :create, {:appointment => valid_attributes}, valid_session
        expect(response).to redirect_to(Appointment.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved appointment as @appointment" do
        post :create, {:appointment => invalid_attributes}, valid_session
        expect(assigns(:appointment)).to be_a_new(Appointment)
      end

      it "re-renders the 'new' template" do
        post :create, {:appointment => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:another_doctor) { create :doctor, specialty: doctor.specialty }
      let(:new_attributes) {
        attributes_for :appointment, doctor_id: another_doctor.id, patient_id: patient.id
      }

      it "updates the requested appointment" do
        put :update, {:id => appointment.to_param, :appointment => new_attributes}, valid_session
        appointment.reload
        expect(appointment.doctor.id).to eq another_doctor.id
      end

      it "assigns the requested appointment as @appointment" do
        put :update, {:id => appointment.to_param, :appointment => valid_attributes}, valid_session
        expect(assigns(:appointment)).to eq(appointment)
      end

      it "redirects to the appointment" do
        put :update, {:id => appointment.to_param, :appointment => valid_attributes}, valid_session
        expect(response).to redirect_to(appointment)
      end
    end

    context "with invalid params" do
      it "assigns the appointment as @appointment" do
        put :update, {:id => appointment.to_param, :appointment => invalid_attributes}, valid_session
        expect(assigns(:appointment)).to eq(appointment)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => appointment.to_param, :appointment => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested appointment" do
      expect {
        delete :destroy, {:id => appointment.to_param}, valid_session
      }.to change(Appointment, :count).by(-1)
    end

    it "redirects to the appointments list" do
      delete :destroy, {:id => appointment.to_param}, valid_session
      expect(response).to redirect_to(appointments_url)
    end
  end

end
