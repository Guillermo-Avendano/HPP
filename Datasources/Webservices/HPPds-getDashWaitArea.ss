function getDashWaitArea(){
	var queryStr = "select target_area, round(avg(process_duration),1) promedio from process  where status = 'IDLE' group by target_area";
	try{
		$s.query("HPPds", queryStr);
			results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getDashWaitArea();
