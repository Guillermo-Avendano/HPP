function insProcess(){
	var queryStr = "INSERT INTO \"public\".\"process\" (\"contrato_id\",\"process_id\",\"process_date\",\"process_date_end\",\"process_start_date\",\"source_area\",\"target_area\",\"step_duration\",\"process_duration\",\"total_duration\",\"status\",\"username\",\"userid\") VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contrato_id");
		$s.setInteger(2, "process_id");
		$s.setLong(3, "process_date");
		$s.setLong(4, "process_date_end");
		$s.setLong(5, "process_start_date");
		$s.setString(6, "source_area");
		$s.setString(7, "target_area");
		$s.setBigDecimal(8, "step_duration");
		$s.setBigDecimal(9, "process_duration");
		$s.setBigDecimal(10, "total_duration");
		$s.setString(11, "status");
		$s.setString(12, "username");
		$s.setString(13, "userid");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
insProcess();
