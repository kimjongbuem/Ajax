var request = new XMLHttpRequest();
function searchFunc(){
	request.open("Post","./UserSearchServlet?userName="+ encodeURIComponent(document.getElementById("userName").value), true);
	request.onreadystatechange = searchProcess;
	request.send(null);
}
function searchProcess(){
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";
	if(request.readyState==4 && request.status == 200){
		var obj = eval('('+request.responseText+')');
		var result = obj.result;
		for(var i = 0; i< result.length;i++){
			var row = table.insertRow(0);
			for(var j = 0; j<result[i].length;j++){
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}	
		}	
	}
}
window.onload = function(){
	searchFunc();
}
