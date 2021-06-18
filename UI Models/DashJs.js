class DashJS {
  constructor() {}
  
  // Genera numero aleatorio entre 0 y 250
  generarNumero (numero){return (Math.random()*numero).toFixed(0); }
  
  
  // 
  colorRGB(){
    var coolor = "("+this.generarNumero(255)+"," + this.generarNumero(255) + "," + this.generarNumero(255) +")";
    return "rgb" + coolor;
  }
//

    CrearDashboard(dash_id, dash_header, dash_labels, dash_data, dash_type) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element['getContext']('2d');
    
    let myChart = new Chart(ctx, {
    
    	type: dash_type,
    
    	data: {
    
    		labels: dash_labels,
    
    		datasets: [{
    
    			label: dash_header,
    			data: dash_data,
    			backgroundColor: dash_color,
    			borderColor: dash_color,
    			borderWidth: 1
    		}]
    	},
    	options: {
    		scales: {
    			yAxes: [{
    				ticks: {
    					beginAtZero: true
    				}
    			}]
    		}
    	}
     }
    
    );
    }

}
