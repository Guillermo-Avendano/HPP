class HPP {
  constructor(){ 
       const SOLICITANTE = "SOLICITANTE";
       const CONTRATOS   = "CONTRATOS";
       const JURIDICO    = "JURIDICO";
  }
   newConfig(typeConfig) {
       var jsonReturn = {};
       switch(typeConfig) {
          case "SOLICITANTE":
               jsonReturn = {A_SOURCE           : "SOLICITANTE",
                             A_TARGET_OK        : "CONTRATOS",
                             A_TARGET_ERR       : "",
                             ST_REJECTED        : "rejeitado",
                             ST_REJECTED_CLOSED : "rejeitado-fechado",
                             ST_REVISION        : "revisão",
                             userid             : "bruno.maia@hpp.org.br",
                             username           : "Bruno Maia" };
               break;
          case "CONTRATOS":
               jsonReturn = {A_SOURCE           : "CONTRATOS",
                             A_TARGET_OK        : "JURIDICO",
                             A_TARGET_ERR       : "SOLICITANTE",
                             ST_REJECTED        : "rejeitado-contratos",
                             ST_REJECTED_CLOSED : "rejeitado-fechado",
                             ST_REVISION        : "revisão",
                             userid             : "leandro.manoel@hpp.org.br",
                             username           : "Leandro Manoel" };
               break;
          case "JURIDICO":
               jsonReturn = {A_SOURCE           : "JURIDICO",
                             A_TARGET_OK        : "DIRECCION",
                             A_TARGET_ERR       : "CONTRATOS",
                             ST_REJECTED        : "rejeitado-juridico",
                             ST_REJECTED_CLOSED : "rejeitado-fechado",
                             ST_REVISION        : "revisão",
                             userid             : "Juridico@hpp.org.br",
                             username           : "Juridico" };
               break;
          default:
            // code block
        }
        
        // Propiedades Comunes y variables de uso de estados
        jsonReturn.ST_IDLE          = "IDLE";
        jsonReturn.filtro           = "";
        jsonReturn.saveAnalisis     = "";
        jsonReturn.continua         = "OK";
        jsonReturn.btn              = "";
        // Solo se usaran para procesos IDLE
        jsonReturn.process_date     = "";
        jsonReturn.process_date_end = "";
        
       Object.preventExtensions(jsonReturn);  
       
       return jsonReturn;
   }
   
   newContrato() {
       var jsonReturn = {};
       jsonReturn = {contrato_id : "",
                    process_id : "",
					process_date : "", 
					process_date_new : "",  // agregado para calculo de tiempos de duracion, no es parte de la tabla
					process_start_date : "",
					tipocontrato : "",
					contratante : "",
					cnpj_contratante : "",
					contratada : "",
					cnpj_contratada : "",
					objetivo : "",
					obcontratada : "",
					obcontratante : "",
					responsavel : "",
					setor : "",
					data_base  : "",
					vigencia : "",
					fuentepag : "",
					indice : "",
					rescisao : "",
					multa : "",
					juros : "",
					mensal : "",
					vencimento : "",
					total : "",
					prestador_actual : "",
					valor_actual : "",
					cotacoes_1 : "",
					cotacoes_2 : "",
					cotacoes_3 : "",
					economia_media : "",
					justificativa : "",
					username : "",
					userid   : "",
					data_aprovado : "",
                    contrato_id_mestre : "",
                    process_id_mestre : "",
					process_date_mestre : ""};
        Object.preventExtensions(jsonReturn);
        return jsonReturn; 					
   }
  newProcess(){
      var jsonReturn = {};
       jsonReturn = {contrato_id : "",
    				 process_id : "",
    				 process_date : "", 
    				 process_date_end : "",
    				 process_start_date : "",
    				 source_area : "",
    				 target_area : "",
    				 step_duration : 0,
    				 process_duration : 0,
    				 total_duration : 0,
    				 status : "",
    				 userid : "",
                     username : ""};
        Object.preventExtensions(jsonReturn);
        return jsonReturn; 					
  } 
  newAnalisis(){
      var jsonReturn = {};
       jsonReturn = {contrato_id : "",
    				process_id : "", 
    				process_date : "", 
                    clausula : "",
    				descricao : "",
    				indicacoes : "",  
    				retorno : ""};
        Object.preventExtensions(jsonReturn);
        return jsonReturn; 					    				
  }
    newCheckList(){
      var jsonReturn = {};
       jsonReturn = {contrato_id : "",
    				process_id : "", 
    				process_date : "", 
                    indice : "", 
                    descricao : "" , 
                    cumpre : "", 
                    critica : ""}
    				
        Object.preventExtensions(jsonReturn);
        return jsonReturn; 					    				
  }

}
