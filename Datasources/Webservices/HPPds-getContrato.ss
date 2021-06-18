function getContrato(){
	var queryStr = "SELECT \"contrato_id\",\"process_id\",\"process_date\",\"process_start_date\",\"tipocontrato\",\"contratante\",\"cnpj_contratante\",\"contratada\",\"cnpj_contratada\",\"objetivo\",\"obcontratada\",\"obcontratante\",\"responsavel\",\"setor\",\"data_base\",\"vigencia\",\"fuentepag\",\"indice\",\"rescisao\",\"multa\",\"juros\",\"mensal\",\"vencimento\",\"total\",\"prestador_actual\",\"valor_actual\",\"cotacoes_1\",\"cotacoes_2\",\"cotacoes_3\",\"economia_media\",\"justificativa\",\"username\",\"userid\",\"data_aprovado\" , count(*) OVER() AS full_count FROM \"public\".\"contrato\" WHERE \"contrato_id\"= ? AND \"process_id\"= ? AND \"process_date\"= ?";
	var queryStrWithLimit = "SELECT \"contrato_id\",\"process_id\",\"process_date\",\"process_start_date\",\"tipocontrato\",\"contratante\",\"cnpj_contratante\",\"contratada\",\"cnpj_contratada\",\"objetivo\",\"obcontratada\",\"obcontratante\",\"responsavel\",\"setor\",\"data_base\",\"vigencia\",\"fuentepag\",\"indice\",\"rescisao\",\"multa\",\"juros\",\"mensal\",\"vencimento\",\"total\",\"prestador_actual\",\"valor_actual\",\"cotacoes_1\",\"cotacoes_2\",\"cotacoes_3\",\"economia_media\",\"justificativa\",\"username\",\"userid\",\"data_aprovado\" , count(*) OVER() AS full_count FROM \"public\".\"contrato\" WHERE \"contrato_id\"= ? AND \"process_id\"= ? AND \"process_date\"= ? LIMIT ? OFFSET ?";
	try{
		if($s.getParameter("limit") && $s.getParameter("limit") != "" && $s.getParameter("offset") && $s.getParameter("offset") != ""){
		$s.query("HPPds", queryStrWithLimit);
		$s.setLong(4, "limit");
		$s.setLong(5, "offset");
		}else{
		$s.query("HPPds", queryStr);
		}
	$s.setString(1, "contrato_id");
	$s.setInteger(2, "process_id");
	$s.setLong(3, "process_date");
		results = $s.queryDb();
		$s.sendResponse(200, results);
} catch(e) {
			java.lang.System.out.println(e);
			$s.sendResponse(500, e);
		}
}
getContrato();
