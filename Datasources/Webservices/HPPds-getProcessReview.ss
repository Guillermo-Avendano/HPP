function getProcessReview(){
	var queryStr = "select * from revision_v where contrato_id = ?   and process_id = ?";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contrato");
	$s.setInteger(2, "process");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
getProcessReview();
