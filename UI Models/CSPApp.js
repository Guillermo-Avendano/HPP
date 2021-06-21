class CSPApp {
  constructor(){ 
 
  }
   newConfig() {
       var jsonReturn = {};
           jsonReturn = {btn : "add",       // Sirve para activar los bonotes Add/Update y Remove
                        keytable : "car"   // Utilizadado en conjunto con btn
                        };
                        
        Object.defineProperty(jsonReturn, 'BTN_ADD', { value: "add", writable : false, enumerable : true, configurable : false});
        Object.defineProperty(jsonReturn, 'BTN_ANY', { value: "any", writable : false, enumerable : true, configurable : false});            
        Object.preventExtensions(jsonReturn); 
        return jsonReturn;
       }
   }