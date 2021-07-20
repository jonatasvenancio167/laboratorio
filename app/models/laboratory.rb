class Laboratory < ApplicationRecord
	belongs_to :exams

	validate :status_desc

	# <Sumary>
	# Returns the type of the status

	def status_desc
		self.status ? 'ativo' : 'inativo'
	end
end
