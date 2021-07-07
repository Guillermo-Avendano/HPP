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

    CrearDashPie(dash_id, dash_header, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element['getContext']('2d');
    
    let myChart = new Chart(ctx, {
                    	type: 'pie',
                    	data: {
                    
                    		labels: dash_labels,
                    
                    		datasets: [{
                    
                    			label: dash_header,
                    			data: dash_data,
                    			backgroundColor: dash_color,
                    			borderColor: dash_color,
                    			borderWidth: 2
                    		}]
                    	},
                    	options: {  responsive: true,
                                    plugins: {
                                      legend: {
                                        position: 'top',
                                      },
                            	       title: {
                                        display: true,
                                        text: dash_header
                                        }
                                    }
                    	        }
                        }  );
    }
    
     CrearDashDona(dash_id, dash_header, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element['getContext']('2d');
    
    let myChart = new Chart(ctx, {
                    	type: 'doughnut',
                    	data: {
                    
                    		labels: dash_labels,
                    
                    		datasets: [{
                    
                    			label: dash_header,
                    			data: dash_data,
                    			backgroundColor: dash_color,
                    			borderColor: dash_color,
                    			borderWidth: 2
                    		}]
                    	},
                    	options: {  responsive: true,
                                    plugins: {
                                      legend: {
                                        position: 'top',
                                      },
                            	       title: {
                                        display: true,
                                        text: dash_header
                                        }
                                    }
                    	        }
                        }  );
    }
    
    
    CrearDashBar(dash_id, dash_header, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element.getContext('2d');
    
    let myChart = new Chart(ctx, {
                	type: 'bar',
                	data: {
                
                		labels: dash_labels,
                
                		datasets: [{
                
                			label: dash_header,
                			data: dash_data,
                			backgroundColor: dash_color,
                			borderColor: dash_color,
                			borderWidth: 2
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
                 } );
    }
    
    
     CrearDashLine(dash_id, dash_header, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element.getContext('2d');
    
    let myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: dash_labels,
                        datasets: [{
                                data: dash_data,
                                label: dash_header,
                                borderColor: "#3e95cd",
                                fill: false
                                }]
                                },
                        options: {
                        title: {
                                display: true,
                                text: dash_header
                        }
                    }  });
    }

}
