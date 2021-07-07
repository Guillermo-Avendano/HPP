function getDashItemInbox(){
	var queryStr = "select target_area, count(*) cantidad  from contrato, process  where contrato.contrato_id = process.contrato_id and contrato.process_id = process.process_id and  contrato.process_date = process.process_date group by target_area";
	try{
		$s.query("HPPds", queryStr);
			results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getDashItemInbox();
