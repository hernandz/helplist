

// When the textbox is entered
document.getElementById("search").onfocus = function() {
	document.body.onkeydown = function() {
	document.getElementById("filtered").style.display="";
	document.getElementById("unfiltered").style.display="none";

	var substring = document.getElementById("search").value;
	var lecture_id = document.getElementById("lecture-id").dataset.lectureId;
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
			if (this.status == 200) {
				document.getElementById("filtered").innerHTML = this.responseText;
			}
			else {
				document.getElementById("filtered").innerHTML = "Search error";
			}
		}
	}
	xhr.open("GET", "/questions/html_filter?substring=" + substring + "&lecture_id=" + lecture_id);
	xhr.send();

		if (/^\s*$/.test(substring)){
		   //value is either empty or contains whitespace characters
		   //do not append the value
			document.getElementById("filtered").style.display="none";
			document.getElementById("unfiltered").style.display="";

		}
	

	// Return false to prevent the form from actually submitting and reloading the page
	//return false;
	}
}
