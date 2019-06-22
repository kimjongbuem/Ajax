<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/func.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/bootstrap.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta charset="UTF-8" http-equiv="Content-type" content="text/html">
<meta name="viewport" content="width-device-width, initial-scale=1">
<title>JSP AJAX</title>
</head>
<body>
	<br>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<input class="form-control" id="userName" onkeyup="searchFunc();" type="text" size="20"/>
			</div>
			<div class="col-xs-2">
				<button class="btn btn btn-primary" type="button" onclick="searchFunc();">검색</button>
			</div>
		</div>
		<table class="table" style="text-align : center; border:1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color : #fafafa; text-align : center;">이름</th>
				<th style="background-color : #fafafa; text-align : center;">나이</th>
				<th style="background-color : #fafafa; text-align : center;">성별</th>
				<th style="background-color : #fafafa; text-align : center;">이메일</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
			
		</tbody>
		</table>
	</div>
</body>
</html>