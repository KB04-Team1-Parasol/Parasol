<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alert</title>
</head>
<body>

	<script>
	    var msg = '${msg}';
	    var url = '${url}';
	    if(confirm(msg))
	    	location.href = url;
	    else
			history.back();
	</script>
</body>
</html>