<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join id Check</title>
</head>
<body>
<h1>아이디 중복 검사</h1>
<form name="check_form" method="post">
<table>
<tr>
<td><input type="text" name="id" value="${id}"></td>
</tr>
</table>
</form>
<script>
function idok(id){
	 opener.check_form.id.value = document.join_form.id.value;  //오프너가 부모 창(여기서 도큐먼트가 윈도우로 띄운 창)
	 opener.check_form.reid.value = document.join_form.id.value;
	 self.close();
}
</script>
</body>
</html>