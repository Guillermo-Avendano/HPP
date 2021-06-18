function getProcesoHist(){
	var queryStr = "select process_id,        process_date,        TO_CHAR(TO_TIMESTAMP(process_date/1000), 'YYYY-MM-DD HH24:MI:SS') view_date,        source_area,        target_area,        step_duration, 	   process_duration, 	   total_duration, 	   status, 	   username from process	    where contrato_id = ? order by process_date desc";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contratoid");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getProcesoHist();
