<%@ include file="/includes/pagetop-all.jsp" %>
<div class="container">

<%@ include file="/AO/BlueJ2/includes/zijmenu.jsp" %>
      
      <div class="col-md-9">
	        <h2>Introductie</h2>
	        <!-- Leerdoelen -->
	        <div class="bs-callout bs-callout-warning">
		       <h2>Leerdoelen</h2>
						<p>Na het bestuderen van dit hoofdstuk wordt van je verwacht dat je:</p>
						<ul>
							<li>BlueJ hebt ge&iuml;nstalleerd</li>
							<li>Weet hoe je met de bijgeleverde voorbeelden kunt werken</li>
							
						</ul>
		          
	        </div>
	        <div class="bs-callout bs-callout-info">
		        <h2>Studeeraanwijzingen</h2>
				<p>Kopieer de <a href="https://github.com/ROC-DEV/bluej-voorbeelden" target="_blank">map met
					voorbeelden</a> naar een map op je computer. Je kunt de voorbeelden openen in BlueJ.</p>
	        </div>
			
			<h2>BlueJ</h2>
			<p>In deze cursus werken we met een - voornamelijk voor educatieve doeleinden ontwikkelde &quot;IDE&quot;. 
			BlueJ verschilt van andere ontwikkelomgevingen doordat het de klassenstructuur weergeeft (in een diagram 
			gelijkend op <a href="http://nl.wikipedia.org/wiki/Unified_Modeling_Language">UML</a>) waarin objecten interactief 
			gecre&euml;erd en getest kunnen worden.</p>
			<img class="imgfullwidth" src="/AO/BlueJ/images/BlueJ_screenshot.png" alt="BlueJ screenshot">
			<p><span class="letop">Tip:</span> Voor degenen die BlueJ meteen wat beter willen leren kennen <a href="/AO/BlueJ/CDRom/handleidingen/BJtutorial-201.pdf">hier </a>een 
			uitgebreide Engelstalige tutorial van BlueJ.</p>
					
	</div>
</div>
<%@ include file="/AO/BlueJ2/includes/bottom.html" %>
<script>
	$(document).ready(function () {
		$("li#h1").addClass("selected");
	})
</script>
</html>

