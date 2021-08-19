class PatientsController < ApplicationController
	def index
		@patients = Patient.all
	end

	def create
		lab_data = LaboratoryApiService.new.call(params)
		CreatePatientLabService.new.call(lab_data)

		redirect_to root_path
	end
end
