<%@ include file="/AO/JSP_Java_DB/includes/pagetop.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
<script src="yahtzee.js"></script>

<%	if (user != null) { 
	


%>



      <!-- inhoud -->
		<div class="col-md-10">
     
      		<h2>YAHTZEE!</h2>
  
	        <!-- oranje border links -->
	        <div class="bs-callout bs-callout-warning">
	     
	        </div>
        
        
        
	        <!-- blauwe border links -->
	        <div class="bs-callout bs-callout-info">
	
	        </div>
	        
	        
	        <div id="yahtzee_scherm">
	        	
	        	<div id="dobbelvelden">
	        		
	        		<%for (int i = 0; i < 5; i++) {%>
	        			<div class="dobbelveld" id="dobbel_<%= i %>" data-nr="<%= i %>"></div>
	        		<% } %>
	        	
	        	</div>
	        	<div id="gooi_knop">
	        		<button type="button" id="gooi_button">Gooi</button>
	        	</div>
	        	
	        	<div id="scores">
	        		<div id="scores_links">
	        			<button type="button" class="score_button" id="button_enen">enen</button>
	        			<input type="text" class="score" value="" id="score_enen" disabled>
	        			<button type="button" class="score_button" id="button_tweeen">twee&euml;n</button>
	        			<input type="text" class="score" value="" id="score_tweeen" disabled>
	        			<button type="button" class="score_button" id="button_drieen">drie&euml;n</button>
	        			<input type="text" class="score" value="" id="score_drieen" disabled>
	        			<button type="button" class="score_button" id="button_vieren">vieren</button>
	        			<input type="text" class="score" value="" id="score_vieren" disabled>
	        			<button type="button" class="score_button" id="button_vijven">vijven</button>
	        			<input type="text" class="score" value="" id="score_vijven" disabled>
	        			<button type="button" class="score_button" id="button_zessen">zessen</button>
	        			<input type="text" class="score" value="" id="score_zessen" disabled>
	        			<label id="totaal_score">Totaal</label>
	        			<input type="text" class="score" value="" id="score_totaal" disabled>
	        		</div>
	        		<div id="scores_rechts">
	        			<input type="text" class="score" value="" id="score_3dezelfde" disabled>
	        			<button type="button" class="score_button" id="button_3dezelfde">3 dezelfde</button>
	        			<input type="text" class="score" value="" id="score_carre" disabled>
	        			<button type="button" class="score_button" id="button_carre">carr&eacute;</button>
	        			<input type="text" class="score" value="" id="score_full_house" disabled>
	        			<button type="button" class="score_button" id="button_full_house">full house</button>
	        			<input type="text" class="score" value="" id="score_kl_straat" disabled>
	        			<button type="button" class="score_button" id="button_kl_straat">kl. straat</button>
	        			<input type="text" class="score" value="" id="score_gr_straat" disabled>
	        			<button type="button" class="score_button" id="button_gr_straat">gr. straat</button>
	        			<input type="text" class="score" value="" id="score_yahtzee" disabled>
	        			<button type="button" class="score_button" id="button_yahtzee">YAHTZEE!</button>
	        			<input type="text" class="score" value="" id="score_chance" disabled>
	        			<button type="button" class="score_button" id="button_chance">chance</button>
	        		</div>
	        	</div>
	        	
	        	<div id="nieuw_spel_knop">
	        		<button type="button" id="nieuw_spel_button">Nieuw spel</button>
	        	</div>

	        </div>

				
		</div>
		


<%@ include file="/includes/bottom.html" %>
</body>

<% } %>
