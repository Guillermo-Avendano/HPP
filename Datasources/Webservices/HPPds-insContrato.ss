function insContrato(){
	var queryStr = "INSERT INTO \"public\".\"contrato\" (\"contrato_id\",\"process_id\",\"process_date\",\"process_start_date\",\"tipocontrato\",\"contratante\",\"cnpj_contratante\",\"contratada\",\"cnpj_contratada\",\"objetivo\",\"obcontratada\",\"obcontratante\",\"responsavel\",\"setor\",\"data_base\",\"vigencia\",\"fuentepag\",\"indice\",\"rescisao\",\"multa\",\"juros\",\"mensal\",\"vencimento\",\"total\",\"prestador_actual\",\"valor_actual\",\"cotacoes_1\",\"cotacoes_2\",\"cotacoes_3\",\"economia_media\",\"justificativa\",\"username\",\"userid\") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contrato_id");
		$s.setInteger(2, "process_id");
		$s.setLong(3, "process_date");
		$s.setLong(4, "process_start_date");
		$s.setString(5, "tipocontrato");
		$s.setString(6, "contratante");
		$s.setString(7, "cnpj_contratante");
		$s.setString(8, "contratada");
		$s.setString(9, "cnpj_contratada");
		$s.setString(10, "objetivo");
		$s.setString(11, "obcontratada");
		$s.setString(12, "obcontratante");
		$s.setString(13, "responsavel");
		$s.setString(14, "setor");
		$s.setLong(15, "data_base");
		$s.setString(16, "vigencia");
		$s.setString(17, "fuentepag");
		$s.setString(18, "indice");
		$s.setString(19, "rescisao");
		$s.setLong(20, "multa");
		$s.setString(21, "juros");
		$s.setLong(22, "mensal");
		$s.setString(23, "vencimento");
		$s.setLong(24, "total");
		$s.setString(25, "prestador_actual");
		$s.setString(26, "valor_actual");
		$s.setString(27, "cotacoes_1");
		$s.setString(28, "cotacoes_2");
		$s.setString(29, "cotacoes_3");
		$s.setString(30, "economia_media");
		$s.setString(31, "justificativa");
		$s.setString(32, "username");
		$s.setString(33, "userid");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
insContrato();
