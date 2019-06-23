<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8" http-equiv="Content-type" content="text/html">
<meta name="viewport" content="width-device-width, initial-scale=1">
<meta charset="UTF-8">
<title>AJAX testings</title>
</head>
<script>
var request = XMLHttpRequest();
function searchFunc(){
	request.open("Post","./UserTestServlet?userName="+encodeURIComponent(document.getElementById("userName").value),true);
	request.onreadystatechange = searchProcess;
	request.send(null);
}
function searchProcess(){
	var table = document.getElementById("ajaxTable");
	table.innerHTML = "";
	if(request.readyState==4 && request.status == 200){
		var obj = eval('('+request.responseText+')');
		var result = obj.result;
		for(var i = 0; i<result.length;i++){
			var row = table.insertRow(i);
			for(var j = 0; j<result[i].length;j++){
			var col = row.insertCell(j);
			col.innerHTML =result[i][j].value;
			}
		}
	}
}
window.onload = function(){
	searchFunc();
}
</script>
<body>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" onkeyup="searchFunc()"type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn btn-primary" onclick="searchFunc();">확인</button>
			</div>
		</div>
		<table class="table" style="text-align : center; border:1px solid #dddddd">
			<thead>
			<tr>
				<th style= "background-color : #fafafa; text-align:center;">이름</th>
				<th style= "background-color : #fafafa; text-align:center;">나이</th>
				<th style= "background-color : #fafafa; text-align:center;">성별</th>
				<th style= "background-color : #fafafa; text-align:center;">이메일</th>
			<tr>
			</thead>
			<tbody id = "ajaxTable">
				
			</tbody>
		</table>
	</div>
</body>
</html>