class Laboratory < ApplicationRecord

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
