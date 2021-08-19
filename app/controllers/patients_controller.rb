class PatientsController < ApplicationController
	def index
	end

	def create
		get_json_data = GetLaboratoryApiService.new.call(params)
		data = CreatePatientLabService.new.get_record(get_json_data)
	end
end
