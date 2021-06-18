function delProcessCounter(){
	var queryStr = "DELETE FROM \"public\".\"process_counter\" WHERE \"process_id\"= ?";
	try{
		$s.query("HPPds", queryStr);
		$s.setLong(1, "process_id");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
delProcessCounter();
