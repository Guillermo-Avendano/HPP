function selectContratoAnalisisProceso(){
	var queryStr = "SELECT \"contrato_id\",\"process_id\",\"process_date\",\"clausura\",\"descricao\",\"indicacoes\",\"retorno\" , count(*) OVER() AS full_count FROM \"public\".\"contrato_analisis\" WHERE \"contrato_id\"= ? AND \"process_id\"= ?";
	var queryStrWithLimit = "SELECT \"contrato_id\",\"process_id\",\"process_date\",\"clausura\",\"descricao\",\"indicacoes\",\"retorno\" , count(*) OVER() AS full_count FROM \"public\".\"contrato_analisis\" WHERE \"contrato_id\"= ? AND \"process_id\"= ? LIMIT ? OFFSET ?";
	try{
		if($s.getParameter("") && $s.getParameter("") != "" && $s.getParameter("") && $s.getParameter("") != ""){
		$s.query("HPPds", queryStrWithLimit);
		$s.setLong(3, "");
		$s.setLong(4, "");
		}else{
		$s.query("HPPds", queryStr);
		}
	$s.setString(1, "contrato_id");
	$s.setInteger(2, "process_id");
		results = $s.queryDb();
		$s.sendResponse(200, results);
} catch(e) {
			java.lang.System.out.println(e);
			$s.sendResponse(500, e);
		}
}
selectContratoAnalisisProceso();
