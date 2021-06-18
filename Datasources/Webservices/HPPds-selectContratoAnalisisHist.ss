function selectContratoAnalisisHist(){
	var queryStr = "select * from contrato_analisis_hist_v where contrato_id = ?";
	try{
		$s.query("HPPds", queryStr);
		$s.setString(1, "contratoid");
		results = $s.queryDb();
		$s.sendResponse(200, results);
	} catch(e) {
		$s.sendResponse(500, e);
	}
}
selectContratoAnalisisHist();
