<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirm</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- css setting -->
<jsp:include page="/WEB-INF/jsp/settings/css.jsp"/>
</head>
<body>

	<script>
	    var msg = '${msg}';
	    var msgArr = msg.split('. ');
	    var msg1 = msgArr[0]+'.';
	    var msg2 = msgArr[1];
	    var url = '${url}';
	    
	    Swal.fire({
	    	  title: msg1,
	    	  text: msg2,
	    	  icon: 'warning',
	    	  showCancelButton: true,
	    	  confirmButtonColor: '#3085d6',
	    	  cancelButtonColor: '#d33',
	    	  confirmButtonText: 'Yes'
	    	}).then((result) => {
	    	  if (result.isConfirmed) {
		    	location.href = url;
	    	  }else{
				history.back();
	    	  }
	    	})
	    	
	</script>
</body>
</html>