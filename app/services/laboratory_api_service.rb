class LaboratoryApiService

	def call params
		file = params[:case1].present? ? "case_1.json" : "case_2.json"
		File.read("#{Rails.root}/public/#{file}")
	end
end
