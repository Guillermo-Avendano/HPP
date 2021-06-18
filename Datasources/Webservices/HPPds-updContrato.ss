function updContrato(){
	var queryStr = "UPDATE \"public\".\"contrato\" SET \"process_date\"=?,\"process_start_date\"=?,\"tipocontrato\"=?,\"contratante\"=?,\"cnpj_contratante\"=?,\"contratada\"=?,\"cnpj_contratada\"=?,\"objetivo\"=?,\"obcontratada\"=?,\"obcontratante\"=?,\"responsavel\"=?,\"setor\"=?,\"data_base\"=?,\"vigencia\"=?,\"fuentepag\"=?,\"indice\"=?,\"rescisao\"=?,\"multa\"=?,\"juros\"=?,\"mensal\"=?,\"vencimento\"=?,\"total\"=?,\"prestador_actual\"=?,\"valor_actual\"=?,\"cotacoes_1\"=?,\"cotacoes_2\"=?,\"cotacoes_3\"=?,\"economia_media\"=?,\"justificativa\"=?,\"username\"=?,\"userid\"=? WHERE \"contrato_id\"= ? AND \"process_id\"= ?";
	try{
		$s.query("HPPds", queryStr);
	$s.setLong(1, "process_date");
	$s.setLong(2, "process_start_date");
	$s.setString(3, "tipocontrato");
	$s.setString(4, "contratante");
	$s.setString(5, "cnpj_contratante");
	$s.setString(6, "contratada");
	$s.setString(7, "cnpj_contratada");
	$s.setString(8, "objetivo");
	$s.setString(9, "obcontratada");
	$s.setString(10, "obcontratante");
	$s.setString(11, "responsavel");
	$s.setString(12, "setor");
	$s.setLong(13, "data_base");
	$s.setString(14, "vigencia");
	$s.setString(15, "fuentepag");
	$s.setString(16, "indice");
	$s.setString(17, "rescisao");
	$s.setLong(18, "multa");
	$s.setString(19, "juros");
	$s.setLong(20, "mensal");
	$s.setString(21, "vencimento");
	$s.setLong(22, "total");
	$s.setString(23, "prestador_actual");
	$s.setString(24, "valor_actual");
	$s.setString(25, "cotacoes_1");
	$s.setString(26, "cotacoes_2");
	$s.setString(27, "cotacoes_3");
	$s.setString(28, "economia_media");
	$s.setString(29, "justificativa");
	$s.setString(30, "username");
	$s.setString(31, "userid");
	$s.setString(32, "contrato_id");
	$s.setInteger(33, "process_id");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
updContrato();
