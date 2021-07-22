class Laboratory < ApplicationRecord

	has_many :laboratory_exams
	has_many :exams, through: :laboratory_exams

	validate :status_desc

	before_create {active(:status)}

	def active(column)
		self[column] = true
	end

	# <Sumary>
	# Returns the type of the status

	def status_desc
		self.status ? 'ativo' : 'inativo'
	end
end
