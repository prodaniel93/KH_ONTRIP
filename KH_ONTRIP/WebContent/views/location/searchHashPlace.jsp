<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ontrip.image.vo.Image, com.ontrip.place.model.vo.Place , java.util.ArrayList"%>
<%
	ArrayList<Image> placePath = (ArrayList<Image>)request.getAttribute("placePath");
	ArrayList<Place> placeInfo = (ArrayList<Place>)request.getAttribute("placeInfo");
	
	ArrayList<Image> placeHashPath = (ArrayList<Image>)request.getAttribute("placeHashPath");
	ArrayList<Place> placeHashInfo = (ArrayList<Place>)request.getAttribute("placeHashInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"> 
<style>
    body{
        margin:0;
    }
    div{
        box-sizing: border-box;
    }
    .searchtitle{
        width: 1000px;
        margin: auto;
        margin-top: 50px;
        font-size: 60px;
        text-align: center;
    }
    .bottom{
        width: 1000px;
        height: 750px;
        /* border: 1px solid black; */
        margin: auto;
    }
    .outer7{
        background-color: white; /* 해당사이트의 고유한 색상으로 작성 */
        color: black;
        width: 950px;
        height: 200px;
        border: 1px solid black;
        margin: auto;
        margin-top: 10px;
        margin-left: 100x;
        display:flex;
    }
    .outer8{
        width: 35%;
        height: 100%;
        border: 1px solid blue;
    }
    .outer9{
        width: 70%;
        height: 100%;
        /* border: 1px solid red; */
    }
    #mForm{
        border: none
    }
</style>
</head>
<body>
    <%@ include file="../common/navbar.jsp" %>
    
      <br><br><br><br>
      <h1 class="searchtitle">검색결과</h1>

      <br><br>

	<div class="bottom" style="width: 100%">
		<fieldset id="mForm">

			
			<% if(!placeHashPath.isEmpty()) { %>
			<% for(int i=0; i<placeHashPath.size(); i++){ %>
			<div class="outer7"onclick="moveHotel('<%= placeHashInfo.get(i).getPlcName() %>','<%= placeHashInfo.get(i).getDareaName()%>', '<%= loginUser.getMemberNo() %>')">
				<div class="outer8">
					<div class="outer9" style="width: 270px; height: 270px;">
						<img
							src="<%= request.getContextPath() %>/<%=placeHashPath.get(i).getFilePath()+placeHashPath.get(i).getChangeName() %>"
							width="122%" height="198px">
					</div>
				</div>

					<div style="font-size:20px; font-weight:bold; margin-left: 25%; margin-top: 20px;"><input type="button" value="<%=placeHashInfo.get(i).getPlcName() %>" style="border: 0; background-color: white; font-weight: bold;"></div>
	                            <div style="text-align:center; margin: 70px; margin-left: -130px">
		                            <span><%=placeHashInfo.get(i).getPlcAddress() %></span><br>
		                            <span><%=placeHashInfo.get(i).getPlcPnumber() %></span>
	                            </div>
                        </div> 
				<%} %>
			<%} %>
	
		</fieldset>
	</div>
	<script>
		function movePlay(placeName, dareaName, memberNo){
			location.href= "<%=request.getContextPath()%>"+"/selectPlay.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
		}
		
		function moveFood(placeName, dareaName, memberNo){
			location.href= "<%=request.getContextPath()%>"+"/selectFood.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
		}
		
		function moveHotel(placeName, dareaName, memberNo){
			location.href= "<%=request.getContextPath()%>"+"/selectHotel.pe?placeName="+ placeName+ "&dareaName=" +dareaName+  "&memberNo=" +memberNo;
		}

	</script>
</body>
</html>