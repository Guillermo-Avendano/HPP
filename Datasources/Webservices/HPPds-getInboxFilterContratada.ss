function getInboxFilterContratada(){
	var queryStr = "select * from inbox_v  where target_area   = ?   and 	  contratada  ilike ?  order by process_date";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "target_area");
	$s.setString(2, "contratada");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getInboxFilterContratada();
