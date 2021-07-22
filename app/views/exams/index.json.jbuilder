json.array @laboratory_exams.each do |laboratory_exam|
	json.nome laboratory_exam.laboratory.nome
	json.endereco laboratory_exam.laboratory.endereco
	json.status laboratory_exam.laboratory.status_desc
end
