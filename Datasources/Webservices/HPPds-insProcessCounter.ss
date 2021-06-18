function insProcessCounter(){
	var queryStr = "INSERT INTO \"public\".\"process_counter\" (\"descripcion\") VALUES(?)";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "descripcion");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
insProcessCounter();
