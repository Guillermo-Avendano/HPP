function getInbox(){
	var queryStr = "select * from inbox_v where target_area   = ?";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "target_area");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getInbox();
