function selectContratoAnalisisHist(){
	var queryStr = "select process_id,        process_date,        TO_CHAR(TO_TIMESTAMP(process_date/1000), 'YYYY-MM-DD HH24:MI:SS') view_date,        clausula, 	   descricao, 	   indicacoes, 	   retorno from contrato_analisis    where contrato_id = ?  order by process_date desc";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contratoid");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
selectContratoAnalisisHist();
