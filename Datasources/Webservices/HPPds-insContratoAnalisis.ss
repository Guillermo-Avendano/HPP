function insContratoAnalisis(){
	var queryStr = "INSERT INTO \"public\".\"contrato_analisis\" (\"contrato_id\",\"process_id\",\"process_date\",\"clausula\",\"descricao\",\"indicacoes\",\"retorno\") VALUES(?,?,?,?,?,?,?)";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contrato_id");
		$s.setInteger(2, "process_id");
		$s.setLong(3, "process_date");
		$s.setString(4, "clausula");
		$s.setString(5, "descricao");
		$s.setString(6, "indicacoes");
		$s.setString(7, "retorno");
		results = $s.execute();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
insContratoAnalisis();
