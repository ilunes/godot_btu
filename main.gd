extends Control

func _on_calcular_pressed():
	var comprimento = $ColorRect2/MarginContainer2/VBoxContainer/t_comprimento.text
	var largura = $ColorRect2/MarginContainer2/VBoxContainer/t_largura.text
	
	comprimento = float(comprimento)
	largura = float(largura)
	var area
	var fator_carga_termica = 500
	
	area = comprimento * largura
	
	var isolamento_termico = $ColorRect2/MarginContainer2/VBoxContainer/isolamento_termico.selected
	match(isolamento_termico):
		0: fator_carga_termica += 0
		1: fator_carga_termica += 25
		2: fator_carga_termica += 50
	
	var insidencia_sol = $ColorRect2/MarginContainer2/VBoxContainer/sol.selected
	match(insidencia_sol):
		0: fator_carga_termica += 0
		1: fator_carga_termica += 25
		2: fator_carga_termica += 50
	
	var pessoas = $ColorRect2/MarginContainer2/VBoxContainer/t_pessoas.text
	var equipamentos = $ColorRect2/MarginContainer2/VBoxContainer/t_equipamentos.text
	
	pessoas = int(pessoas) * 500
	equipamentos = int(equipamentos) * 500
	
	#print("\ncomprimento : ", comprimento)
	#print("largura : ", largura)
	#print("area : ", area)
	#print("Carga termica : ",fator_carga_termica)
	#print("Pessoas : ",pessoas)
	#print("Equipamentos : ",equipamentos)
	var btu = fator_carga_termica * area + pessoas + equipamentos
	var text_result = "Vai ser necessario um ar condicionado de " + str(btu) + " BTU"
	$ColorRect2/MarginContainer2/VBoxContainer/resultado.text = text_result

