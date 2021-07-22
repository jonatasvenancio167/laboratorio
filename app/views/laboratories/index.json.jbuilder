json.partial! @laboratories do |laboratory|
	json.nome laboratory.nome
	json.endereco laboratory.endereco
	json.status laboratory.status_desc
end 