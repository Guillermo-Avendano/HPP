function updProcessStatus(){
	var queryStr = "UPDATE \"public\".\"process\" SET \"status\"=? WHERE \"contrato_id\"= ? AND \"process_id\"= ? AND \"process_date\"= ?";
	try{
		$s.query("HPPds", queryStr);
	$s.setString(1, "status");
	$s.setString(2, "contrato_id");
	$s.setInteger(3, "process_id");
	$s.setLong(4, "process_date");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
updProcessStatus();
