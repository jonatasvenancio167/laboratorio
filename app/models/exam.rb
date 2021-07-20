class Exam < ApplicationRecord
  has_many :laboratories, through: :laboratory_exams


  validate :status_desc
  validate :type_exam

  #<Sumary>
  # Returns the type of the status

  def status_desc
    self.status ? 'ativo' : 'inativo'
  end

  #<Sumary>
  # Returns the type of the exam

  def type_exam
    ['analise clinica', 'imagem']
  end
end
