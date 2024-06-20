/**
 * 
 */

 
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? '../img/logo.png' : '../img/logoName.png';
      logo.src = logoSrc;
    }
    
    
    function Ricerca(){
    	let filtro = document.getElementById("inputbar").value;
    	sessionStorage.setItem("filter",filtro);	 
}