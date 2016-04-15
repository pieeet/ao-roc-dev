/**
 * Created by piet on 10-02-16.
 */
/**
 * verberg/toon uitwerking
 */


function toon(element) {
    if (document.getElementById(element).style.display != "block") {
        document.getElementById(element).style.display = "block";
    }
    else if (document.getElementById(element).style.display = "block") {
        verberg(element);
    }
}

function verberg(element) {
    document.getElementById(element).style.display = "none";
}


