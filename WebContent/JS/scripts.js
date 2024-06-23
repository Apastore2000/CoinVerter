
 
    function switchLogo() {
      var logo = document.getElementById('logo');
      var logoSrc = window.innerWidth <= 850 ? "img/logo.png" : "img/logoName.png";
      logo.src = logoSrc;
    }
    
   
    
    function Ricerca(size){
    	let filtro 
    	if(size == "big") filtro = document.getElementById("input").value;
    	else if(size == "small")filtro = document.getElementById("inputbar").value;
    	
    	console.log(filtro);
    	
		var currentURL = window.location.href;
    	window.location.href =  currentURL.substring(0, currentURL.lastIndexOf('/') + 1) + 'Shop?filter=' + filtro.toLowerCase()

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
	
	function switchSuite(){
		switchLogo();
		checkWindowWidth();
		
	}
    /*function openSidebar() {
      const isSidebar = document.querySelector("[isOpenSidebar]");
      const sidebar = document.querySelector(".sidebar");
      const sidebarOverlay = document.querySelector(".sidebarOverlay");
      const closeSidebar = document.querySelector(".sidebarHeader .icon");

      isSidebar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (sidebar.classList.contains("show")) {
          sidebar.classList.remove("show");
          sidebar.classList.add("hidden");
        }
        else {
          sidebar.classList.add("show");
          sidebar.classList.remove("hidden");
        }
      });

      sidebarOverlay.addEventListener("click", (e) => {
        console.log("Clicked sidebar overlay");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });

      closeSidebar.addEventListener("click", (e) => {
        console.log("Clicked close sidebar button");
        sidebar.classList.remove("show");
        sidebar.classList.add("hidden");
      });
    }*/

  /*</script>

  <script>
    function openSearchbar() {
      const isSearchbar = document.querySelector("[isOpenSearchbar]");
      const searchbar = document.querySelector(".searchbar");
      const searchbarOverlay = document.querySelector(".searchbarOverlay");
      const closeSearchbar = document.querySelector(".searchbar #close");
      const closeSearchbar = document.querySelector(".searchbar .");
      //const btn =  document.querySelector("#searchBtn");

      isSearchbar.addEventListener("click", (e) => {
        console.log("Clicked sidebar toggle");
        if (searchbar.classList.contains("show")) {
          searchbar.classList.remove("show");
          searchbar.classList.add("hidden");
          //btn.classList.add("show");
          //btn.classList.remove("hidden");
        }
        else {
          searchbar.classList.add("show");
          searchbar.classList.remove("hidden");
          //btn.classList.remove("show");
          //btn.classList.add("hidden");
        }
      });

      searchbarOverlay.addEventListener("click", (e) => {
        console.log("Clicked searchbar overlay");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

      closeSearchbar.addEventListener("click", (e) => {
        console.log("Clicked close searchbar button");
        searchbar.classList.remove("show");
        searchbar.classList.add("hidden");
        //btn.classList.add("show");
        //btn.classList.remove("hidden");
      });

    }
    openSearchbar();

    function closeSearchbar() {
      const searchbar = document.querySelector(".searchbar");
      //const btn =  document.querySelector("#searchBtn");
      
      //btn.classList.add("hidden");
    }
    function checkWindowWidth() {
      const searchbar = document.querySelector(".searchbar");
      if (window.innerWidth > 850 && searchbar.classList.contains("show")) {
        closeSearchbar();
      }
    }
    window.addEventListener("resize", checkWindowWidth);
    checkWindowWidth();



  
  </script> -->*/
  
  
  