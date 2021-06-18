function insContratoChk(){
	var queryStr = "INSERT INTO \"public\".\"contrato_checklist\" (\"contrato_id\",\"process_id\",\"process_date\",\"indice\",\"descricao\",\"critica\",\"cumpre\") VALUES(?,?,?,?,?,?,?)";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contrato_id");
		$s.setInteger(2, "process_id");
		$s.setLong(3, "process_date");
		$s.setInteger(4, "indice");
		$s.setString(5, "descricao");
		$s.setString(6, "critica");
		$s.setString(7, "cumpre");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
insContratoChk();
