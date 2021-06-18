function getInboxFilterContratada(){
	var queryStr = "select contrato.contrato_id,        contrato.process_id, 	   process.process_date, 	   process.process_date_end,  	   process.process_start_date, 	   TO_CHAR(TO_TIMESTAMP(contrato.process_date/1000), 'YYYY-MM-DD HH24:MI:SS') view_date, 	   contrato.contratante, 	   contrato.contratada, 	   contrato.objetivo, 	   contrato.total, 	   TO_CHAR(TO_TIMESTAMP(contrato.data_base/1000), 'YYYY-MM-DD HH24:MI:SS') data_base, 	   process.step_duration, 	   process.process_duration, 	   process.total_duration from contrato, process where contrato.contrato_id  = process.contrato_id  and       contrato.process_id   = process.process_id   and       contrato.process_date = process.process_date and 	  process.target_area   = ?   and 	  process.status        = ?   and 	  contrato.contratada  ilike ?  order by process.process_date";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "target_area");
	$s.setString(2, "status");
	$s.setString(3, "contratada");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getInboxFilterContratada();
