
 
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? "img/logo.png" : "img/logoName.png";
      logo.src = logoSrc;
    }
    
   
    
    function Ricerca(size){
    	let filtro;
    	if(size == "big") filtro = document.getElementById("input").value;
    	else if(size == "small")filtro = document.getElementById("inputbar").value;
    	if(filtro == null)filtro = "";
		var currentURL = window.location.href;
    	window.location.href =  currentURL.substring(0, currentURL.lastIndexOf('/') + 1) + 'Shop?filter=' + filtro.toLowerCase() + '&action=ricerca' 

}

 function RicercaCat(tipo){
    	let filtro = tipo;
    	
    	var currentURL = window.location.href;
    	window.location.href =  currentURL.substring(0, currentURL.lastIndexOf('/') + 1) + 'Shop?filter=' + filtro + '&action=categoria' 

}


	function openSidebar(id){
		const sidebar = document.getElementById("sideb");

        switch(id){
			case "isOpenSidebar":
				console.log("Clicked sidebar toggle");
				if (sidebar.classList.contains("show")) {
		          sidebar.classList.remove("show");
		          sidebar.classList.add("hidden");
		        }
		        else {
		          sidebar.classList.add("show");
		          sidebar.classList.remove("hidden");
		        }
			break;
			
			case "sideover":
				console.log("Clicked overlay toggle");
				sidebar.classList.remove("show");
        		sidebar.classList.add("hidden");
			break;
				
			case "sidex":
				console.log("Clicked sidebar button toggle");
				sidebar.classList.remove("show");
      			sidebar.classList.add("hidden");
			break;
		}
	}
	
	function openSearchbar(id){
		const searchbar = document.getElementById("sorciobarra");
		
        switch(id){
			case "searchIconBtn":
				console.log("Clicked searchbar toggle");
				if (searchbar.classList.contains("show")) {
		          searchbar.classList.remove("show");
		          searchbar.classList.add("hidden");
		        }
		        else {
		          searchbar.classList.add("show");
		          searchbar.classList.remove("hidden");
		        }
			break;
			
			case "sorcioover":
				console.log("Clicked overlay toggle");
				searchbar.classList.remove("show");
        		searchbar.classList.add("hidden");
			break;
				
			case "close":
				console.log("Clicked sidebar button toggle");
				searchbar.classList.remove("show");
      			searchbar.classList.add("hidden");
			break;
		}
		
	}
	
	function closeSearchbar(){
		const searchbar = document.getElementById("sorciobarra");
		searchbar.classList.remove("show");
		searchbar.classList.add("hidden");
	}
	
	function checkWindowWidth() {
      const searchbar = document.querySelector(".searchbar");
      if (window.innerWidth > 850 && searchbar.classList.contains("show")) {
      	closeSearchbar();
      }
    }
	
	
   	function countElements(cls) {
		const parentElement = document.getElementById('header-block');
		const numberOfElements = parentElement.getElementsByClassName(cls).length;
        console.log(numberOfElements);
        }
	
	function toggleResize(){
		  const styleSheet = document.getElementById('light.css');
            if(countElements("cartContainer")== 4) document.getElementById("toggle").classList.add('banana');
	}
	
	function switchSuite(){
		switchLogo();
		checkWindowWidth();
		toggleResize();	
	}

  
      

  
   
  