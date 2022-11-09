<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.member.model.vo.Member"%>
    
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	// 로그인전 or 로그인 실패 : null
	// 로그인 성공후 : 로그인한 회원의 정보가 담긴 member객체.
	
	String alertMsg = (String) session.getAttribute("alertMsg");
	// 서비스 요청전 : null
	// 서비스 요청성공후 : alert로 띄워줄 메시지 문구.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 

<script
        src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
        crossorigin="anonymous">
    </script>

</head>
<body>
<% if(loginUser != null) { %>
<script>
		let msg = "<%= alertMsg%>"; // let msg = 성공적으로 로그인이 되었습니다.
		
		if(msg != "null"){
			alert(msg);
			// 알림창을 띄워준후 session에 담긴 해당메세지는 지워줘야함.
			// 안그러면 menubar.jsp가 로딩될때마다 매번 alert가 계속 뜰것
			
			<% session.removeAttribute("alertMsg");%>
		}
	</script>
<nav class="navbar bg-light" style="position:fixed; z-index:9999; width:100vw; ">
    <div class="container-fluid" style="background-color: white; padding-bottom: 7px; border-bottom:1px solid rgb(218, 213, 213);">
      <a class="navbar-brand" href="mainPage.html">
        <b class="nav_b">Ontrip</b>&nbsp;
        <h7 style="font-size:13px; color:rgb(151,154,151);">MAKE YOUR ROUTE OPTIMIZED</h7>
      </a>
      <form class="d-flex" role="click">
        
        <button style="border:none; color:black;" class="btn btn-outline-success" type="submit" onclick="myPage();">마이페이지</button>
        <button style="margin-right: 40px; margin-left:20px; color:black; border:none;" class="btn btn-outline-success" type="button"
        	onclick="logout();">로그아웃</button>
      </form>
    </div>
  </nav>
 <% } else {%>
 
 
 
 
 <% } %>
 
 <script>
 	function logout(){
 		location.href = "<%=request.getContextPath()%>/logout.me";
 	}
 
 </script>
  
</body>
</html>