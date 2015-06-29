/**
 * methoden om uitwerkingen te tonen/verbergen
 */

function toon(element) {
	if (document.getElementById(element).style.display != "block") {
		document.getElementById(element).style.display = "block";
	}
	else if (document.getElementById(element).style.display = "block"){
		verberg(element);
	}
}

function verberg(element) {
	document.getElementById(element).style.display = "none";
}


function refreshParent() {        
    window.opener.location.reload(true);
}


function openNieuwLid() {
	var w = 400;
	var h = 600;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);

	nieuwLid = window.open("/AO/JSP_Java_DB/sport/invoerlid.jsp", "nieuwLid",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}


function verzendNieuwLid() {
	document.getElementById("nieuwLid").submit();
	self.close();
	
}

function openNieuwTeam() {
	var w = 400;
	var h = 200;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);

	nieuwTeam = window.open("/AO/JSP_Java_DB/sport/invoerteam.jsp", "nieuwTeam",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function verzendNieuwTeam() {
	document.getElementById("nieuwTeam").submit();
	self.close();
}



function openWijzigLid(spelerscode) {
	var sc = spelerscode;
	var w = 400;
	var h = 600;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);
	
	wijzigLid = window.open("/sport?spelerscode="+sc+"&lidwijzig=+", "wijzigLid",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function verzendWijzigLid() {
	document.getElementById("wijziglidform").submit();
	self.close();
}

function openVerwijderLid(spelerscode) {
	var w = 500;
	var h = 300;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);
	
	wijzigLid = window.open("/sport?spelerscode="+spelerscode+"&lidverwijder=+", "verwijderLid",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function verzendVerwijderLid() {
	document.getElementById("verwijderlidform").submit();
	self.close();
}

function openWijzigTeam(teamcode) {
	
	var w = 400;
	var h = 200;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);
	
	wijzigTeam = window.open("/sport?teamcode="+teamcode+"&teamwijzig=+", "wijzigTeam",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function verzendWijzigTeam() {
	document.getElementById("wijzigteamform").submit();
	self.close();
}

function openVerwijderTeam(teamcode) {
	var w = 400;
	var h = 200;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);
	
	wijzigTeam = window.open("/sport?teamcode="+teamcode+"&teamverwijder=+", "wijzigTeam",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function verzendVerwijderTeam() {
	document.getElementById("verwijderteamform").submit();
	self.close();
}

function openTeamsLid(spelerscode) {
	var w = 600;
	var h = 300;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);
	
	teamsLid = window.open("/sport?spelerscode="+spelerscode+"&lidteams=+", "wijzigTeam",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}

function openLedenVanTeam(teamcode) {
	var w = 600;
	var h = 800;
	var left = (window.screen.width/2)-(w/2);
	var top = (window.screen.height/2)-(h/2);

	ledenTeam = window.open("/sport?teamcode="+teamcode+"&teamleden=+", "wijzigTeam",'toolbar=no, resizable=no,  top='+top+', left='+left+', width='+w+', height='+h);
}




