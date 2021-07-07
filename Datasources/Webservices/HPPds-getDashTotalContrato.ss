function getDashTotalContrato(){
	var queryStr = "select contrato.setor, process.contrato_id as contrato_id, process.total_duration  from contrato, process  where contrato.contrato_id = process.contrato_id and contrato.process_id = process.process_id and  contrato.process_date = process.process_date";
	try{
		$s.query("HPPds", queryStr);
			results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getDashTotalContrato();
