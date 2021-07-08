class DashJS {
  constructor() {}
  
// 
colorRGB(){
    var r = () => Math.random() * 256 >> 0;
    var rgbColor = `rgb(${r()}, ${r()}, ${r()})`;
    
    return rgbColor;
    }
  
//
dashPolar(dash_id, dash_header, dash_lbl, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element.getContext('2d');
    
    let myChart = new Chart(ctx, {
                    	type: 'polarArea',
                    	data: {
                    		labels: dash_labels,
                    		datasets: [{
                    			label: dash_lbl,
                    			data: dash_data,
                    			backgroundColor: dash_color,
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

///

dashPie(dash_id, dash_header, dash_lbl, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element.getContext('2d');
    
    let myChart = new Chart(ctx, {
                    	type: 'pie',
                    	data: {
                    
                    		labels: dash_labels,
                    
                    		datasets: [{
                    
                    			label: dash_lbl,
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
    
dashDona(dash_id, dash_header, dash_lbl, dash_labels, dash_data) { 
        
    var dash_color   = [];

    for (var i=0; i < dash_data.length; i++) {
        dash_color.push (this.colorRGB());
    }    
    
    let element = document.getElementById(dash_id);
    
    let ctx = element.getContext('2d');
    
    let myChart = new Chart(ctx, {
                    	type: 'doughnut',
                    	data: {
                    
                    		labels: dash_labels,
                    
                    		datasets: [{
                    
                    			label: dash_lbl,
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
    
    
dashBar(dash_id, dash_header, dash_lbl, dash_labels, dash_data) { 
        
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
                
                			label: dash_lbl,
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
    
    
dashLine(dash_id, dash_header, dash_lbl, dash_labels, dash_data) { 
        
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
                                label: dash_lbl,
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
