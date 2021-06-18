function getContratoAnalisis(){
	var queryStr = "SELECT \"clausula\",\"descricao\",\"indicacoes\",\"retorno\" , count(*) OVER() AS full_count FROM \"public\".\"contrato_analisis\" WHERE \"contrato_id\"= ? AND \"process_id\"= ? AND \"process_date\"= ?";
	var queryStrWithLimit = "SELECT \"clausula\",\"descricao\",\"indicacoes\",\"retorno\" , count(*) OVER() AS full_count FROM \"public\".\"contrato_analisis\" WHERE \"contrato_id\"= ? AND \"process_id\"= ? AND \"process_date\"= ? LIMIT ? OFFSET ?";
	try{
		if($s.getParameter("") && $s.getParameter("") != "" && $s.getParameter("") && $s.getParameter("") != ""){
		$s.query("HPPds", queryStrWithLimit);
		$s.setLong(4, "");
		$s.setLong(5, "");
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
getContratoAnalisis();
