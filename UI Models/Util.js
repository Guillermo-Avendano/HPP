var util = {
    /** log: muestra en la consola el mensaje msg y objeto JSON como string si existe
     */
    log: function(msg, jsonObj) {
        	if ( typeof jsonObj === 'undefined' || jsonObj === null ) 
        	    console.log(msg); 
        	else
        	    console.log(msg + " " + JSON.stringify(jsonObj)); 
    },
    /**
    * Comprueba la cadena si no está definida, es nula, no es un tipo de cadena, está vacía o con espacios.
    * @param str cadena a evaluar
    * @return {boolean} el resultado evaluado
     */
   isStringNull: function (str) {
        return str === undefined || str === null
                             || typeof str !== 'string'
                             || str.match(/^ *$/) !== null;
    },

    /**
    *copyJson: copia los contenidos de un objeto Json en otro 
    * @param source: es el objeto JSON Source, por ejemplo: { a : "11", b : "12"}
    * @param target: es el objeto JSON Target, por ejemplo: { a : "", b : "", c : "" , d : ""}
    * @return: es el JSON target con los atributos copiados desde source
    *          { a : "11", b : "12", c : "" , d : ""}
    */
    copyJson: function(source,target) {
      let targetArr = JSON.parse(JSON.stringify(target));
      for (var key in source) {
          try {
              targetArr[key] = source[key];
              
          } catch(e) {
        	      console.log("util.copyJson: -> " + e); }
      }
      return targetArr;
    },

    /** arrSort: Ordena el arrar JSON 
    * @param arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                            { a : "21", b : "22"}, 
    *  													         { a : "31", b : "32"}]
    * @param key: "a"  es el nombre de la propiedad del objeto JSON usada para ordenar
    * @param isAsc: "true" indica que es acendente, "false" desendente.
    * @return es el array JSON con la nueva fila agregara, si es que no existe la key
    *          [{ a : "11", b : "12"}, 
    *           { a : "21", b : "22"}, 
    *           { a : "31", b : "32"},
    *           { a : "51", b : "52"}]
    */
    arrSort: function (arrJsonSource, key, isAsc) {
        return arrJsonSource.sort((a, b) => {
            return (a[key] < b[key] ? -1 : 1) * (isAsc ? 1 : -1)
        });
    },
    /** arrFind: Busca un objeto JSON en el array en base a una key/value
    * @param arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                            { a : "21", b : "22"}, 
    *  													         { a : "31", b : "32"}]
    * @param key: "a"  es el nombre de la propiedad del objeto JSON para buscar
    * @param alue: "21" es el valor a buscarr
    * @return objeto JSON encontrato en base a la key, sino devuelve un JSON vacio ()
    *           { a : "21", b : "22"}
    */
    arrFind: function(arrJsonSource, key, value) {
    
    	var i;
    	var found = false;
    	var jsonReturn = {};
    	let sourceArr = JSON.parse(JSON.stringify(arrJsonSource));
    	
    	for (i = 0; i < sourceArr.length; i++) {
    	    try{
            	  if (sourceArr[i][key] == value) {
            		found = true;  
            		break;
        	        } 
        	  } catch(e) {
        	      console.log("util.arrFind: -> " + e);
        	  }
    	  }
    
    	if (found) 
    	   jsonReturn = sourceArr[i];
    	   
    
     return jsonReturn;
    }, 
    /** arrAdd: agrega un objeto JSON al array
    * @param arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                            { a : "21", b : "22"}, 
    *  													         { a : "31", b : "32"}]
    * @param sourceJson: {a : "51", b : "52"} es el objeto Json a agregar
    * @param key: "a"  es el nombre de la propiedad del objeto JSON para buscar que no este repetido
    * @return es el array JSON con la nueva fila agregara, si es que no existe la key
    *          [{ a : "11", b : "12"}, 
    *           { a : "21", b : "22"}, 
    *           { a : "31", b : "32"},
    *           { a : "51", b : "52"}]
    */
    arrAdd: function(arrJsonSource, sourceJson, key) {
    	var i;
    	var found = false;
    	var added = false;
    	let sourceArr = JSON.parse(JSON.stringify(arrJsonSource));
    	
    	for (i = 0; i < sourceArr.length; i++) {
    	    try {
            	  if (sourceArr[i][key] == sourceJson[key]) {
            		found = true;  
            		break;
            	  }
    	      } catch(e) {
        	      console.log("util.arrAdd: -> " + e); }
    	}
    
    	if (!found) {
    	   sourceArr.push(sourceJson);
    	   added = true;
    	   }
    
     return sourceArr;
    },
    
    /** arrUpdate: modifica un objeto JSON en un array
    * @param arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                            { a : "21", b : "22"}, 
    *  													         { a : "31", b : "32"}]
    * @param sourceJson: {a : "21", b : "22 Updated"} es el objeto Json a agregar
    * @param key: "a" es el nombre de la propiedad del objeto JSON para buscar que no este repetido
    * @return es el array JSON con la nueva fila actualizada, si existe la key en el array
    *          [{ a : "11", b : "12"}, 
    *           { a : "21", b : "22 Updated"}, 
    *           { a : "31", b : "32"}]
    */
    arrUpdate: function(arrJsonSource,sourceJson,key) {
    var i;
    var found = false;
    var added = false;
    
    let sourceArr = JSON.parse(JSON.stringify(arrJsonSource));
    
    for (i = 0; i < sourceArr.length; i++) {
        try{
              if (sourceArr[i][key] == sourceJson[key]) {
                found = true;  
                break;
              }
        } catch(e) {
        	      console.log("util.arrUpdate: -> " + e); }
    }
    
    if (found) {
        sourceArr[i] = JSON.parse(JSON.stringify(sourceJson));
     }
     
     return sourceArr;
    },
    /** arrRemove: elimina un objeto JSON en un array
    * @param arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                            { a : "21", b : "22"}, 
    *  													         { a : "31", b : "32"}]
    * @param sourceJson: {a : "21", b : "22 Updated"} es el objeto Json a eliminar
    * @param key: "a" es el nombre de la propiedad del objeto JSON para buscar que no este repetido
    *---------------------------
    * @return array JSON con SIN la fila eliminada
    *          [{ a : "11", b : "12"}, 
    *           { a : "31", b : "32"}]
    */
    arrRemove: function(arrJsonSource,sourceJson,key) {
    	var i;
    	var found = false;
    	var added = false;
    
    	let sourceArr = JSON.parse(JSON.stringify(arrJsonSource));
    
    	for (i = 0; i < sourceArr.length; i++) {
    	    try {
            	  if (sourceArr[i][key] == sourceJson[key]) {
            		found = true;  
            		break;
            	  }
        	} catch(e) {
        	      console.log("util.arrRemove: -> " + e); }
    	}
    	if (found) { 
        
    		if (sourceArr.length == 1 )  {
    		   // Tiene una fila, la encontro entonces inicializo el Array a vacio     
    		   while (sourceArr.length > 0) { sourceArr.pop();}
    		   
    		   // Esto es un ERROR! pero SI el remove no hace un refresh, se puede crear una fila vacia
    		   sourceArr = [{}];
    		  }
    		else {   
    			if (i === 0 ) 
    			   // Esta en al primer fila        
    			   sourceArr.shift();
    			else if ((i + 1) === sourceArr.length ) 
    				   // Esta en la ultima fila
    				   sourceArr.pop();
    				 else 
    				   // Esta en la mitad
    				   removed = sourceArr.splice(i, 1);
    			}
      }
      return sourceArr;
    },
    
    /** arrGetJsonArr: devuelve un array JSON solo con el atributo seleccionado (key)
    * Parametros
    * @param   arrJsonSource: es el array a procesar, por ejemplo [{ a : "11", b : "12"}, 
    *                                                              { a : "21", b : "22"}, 
    *           												   { a : "31", b : "32"}]
    * @param  key: "a"  es el nombre de la propiedad del objeto JSON que sera usada para crear el array JSON de salida
    * @return: array JSON encontrato con el atributo key
    *           [{ a : "11"},
	*            { a : "21"},
    *            { a : "31"}]
	*/
    arrGetJsonArr: function(arrJsonSource, key) {
    	var i;
    	var found = false;
    	var jsonArrReturn = [];
    	let sourceArr = arrJsonSource;
    	
    	for (i = 0; i < sourceArr.length; i++) {
    	    try{
			    jsonArrReturn.push(JSON.parse("{ \"" + key + "\" : \"" + sourceArr[i][key] + "\" }"));
        	  } catch(e) {
        	      console.log("util.arrGetJsonArr: -> " + e);
        	  }
    	  }
    
        return jsonArrReturn;
    }
};
