class CreatePatientLabService

	def get_record(data)
		response_hash = eval(data)

		patient = patient_create_with_response_first(response_hash)
		create_patient_lab(patient, response_hash)
	end

	def patient_create_with_response_first(response_hash)
		fetch_response = patient_data(response_hash)

		Patient.create!(
			fetch_response
        )
	end

	def create_patient_lab(patient, response_hash)
		if !patient.nil?

			params = response_hash[:lab_studies][0]

            patient.patient_labs.create!(
            code: params[:code],
            name: params[:name],
            value: params[:vallue],
            unit: params[:unit],
            ref_range: params[:ref_range],
            finding: params[:finding],
            result_state: params[:result_state]
          )
        end
	end

	private

	def patient_data(response_hash)
		params 	= response_hash
		if params[:patient_name].present?
			id_number 		= params[:id_number],
            patient_name 	= params[:patient_name],
            gender 			= params[:gender],
            date_of_birth 	= params[:date_of_birth]
		else
			second_case_params 		= params[:patient_data]
			id_number 				= second_case_params[:id_number],
            first_name 				= second_case_params[:first_name],
            last_name 				= second_case_params[:last_name],
            phone_mobile 			= second_case_params[:phone_mobile],
            gender 					= second_case_params[:gender],
            date_of_birth 			= second_case_params[:date_of_birth]
		end

		{ id_number: id_number, patient_name: patient_name, gender: gender, date_of_birth: date_of_birth, first_name: first_name, last_name: last_name, phone_mobile: phone_mobile }
	end
end
