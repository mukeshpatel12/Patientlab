class CreatePatientLabService

    def call(data)
        patient_report = eval(data)

        patient = create_patient(patient_report)
        create_patient_lab(patient, patient_report) unless patient.nil?
    end

    def create_patient(patient_report)
        patient_params = set_patient_data(patient_report)

        Patient.create!(patient_params)
    end

    def create_patient_lab(patient, patient_report)
        params = patient_report[:lab_studies]

        params.each do |lab|
            patient.patient_labs.create!(
            code: lab[:code],
            name: lab[:name],
            value: lab[:vallue],
            unit: lab[:unit],
            ref_range: lab[:ref_range],
            finding: lab[:finding],
            result_state: lab[:result_state],
            lab_number: patient_report[:lab_number],
            clinic_code: patient_report[:clinic_code],
            date_of_test: patient_report[:date_of_test]
          )
        end
    end

    private

    def set_patient_data(params)
        if params[:patient_name].present?
            id_number       = params[:id_number]
            patient_name    = params[:patient_name]
            gender          = params[:gender]
            date_of_birth   = params[:date_of_birth]
        else
            data            = params[:patient_data]
            id_number       = data[:id_number]
            patient_name    = data[:first_name] + " " + data[:last_name]
            phone_mobile    = data[:phone_mobile]
            gender          = data[:gender]
            date_of_birth   = data[:date_of_birth]
        end

        { id_number: id_number, patient_name: patient_name, gender: gender, date_of_birth: date_of_birth, phone_mobile: phone_mobile }
    end
end
