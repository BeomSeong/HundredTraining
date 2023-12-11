<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
	int mId = (int)session.getAttribute("mId"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>나의 기록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery.js"></script>

<style>

#d1 {
	display: flex;
}

 #select, #year, #month {
	float:right;
}

h1 {
	text-align: center;
}

</style>

<script>
<%-- function sel_data() {
	var queryString = $("#data_frm").serialize();
	console.log("맨위");
	$.ajax({
		url: '/selData',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			console.log("중간");
			if (result.code=="success") {
				alert("성공")
				window.location.replace("/myRecord?mId=<%=mId%>");
			} else {
				console.log("실패");
				alert(result.desc);
			}
		}
	});
} --%>



function form_check() {
	if($('#tDate').val().length != 8) {
		alert("예) 20231101 예시와 같이 날짜를 입력해주세요.");
		$('#tDate').focus();
		return;
	}
	submit_ajax();
}

function submit_ajax() {
	var queryString = $("#reg_frm").serialize();
	$.ajax({
		url: '/recordForm',
		type: 'POST',
		data: queryString,
		dataType : 'text',
		success: function(json) {
			//console.log(json);
			var result = JSON.parse(json);
			if (result.code=="success") {
				alert("기록 완료")
				window.location.replace("/myRecord?mId=<%=mId%>");
			} else {
				alert(result.desc);
			}
		}
	});
}
</script>

</head>
<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
<br>

<hr>
<h1>나의 기록</h1>
<hr>

<form action="/selData" id="data_frm" method="post">
	<select id="year" name="year" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
	  <option value="2013">2013</option>
	  <option value="2014">2014</option>
	  <option value="2015">2015</option>
	  <option value="2016">2016</option>
	  <option value="2017">2017</option>
	  <option value="2018">2018</option>
	  <option value="2019">2019</option>
	  <option value="2020">2020</option>
	  <option value="2021">2021</option>
	  <option value="2022">2022</option>
	  <option value="2023" selected>2023</option>
	</select>
	
	<select id="month" name="month" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
	  <option value="1">1월</option>
	  <option value="2">2월</option>
	  <option value="3">3월</option>
	  <option value="4">4월</option>
	  <option value="5">5월</option>
	  <option value="6">6월</option>
	  <option value="7">7월</option>
	  <option value="8">8월</option>
	  <option value="9">9월</option>
	  <option value="10">10월</option>
	  <option value="11" selected>11월</option>
	  <option value="12">12월</option>
	</select>
	<input type="hidden" name="mId" value="<%= mId %>">
	<input type="submit" class="btn btn-outline-primary" id="select" value="조회">
</form>
<form action="/myRecord" id="data_frm" method="post">
	<input type="hidden" name="mId" value="<%= mId %>">
	<input type="submit" class="btn btn-outline-primary" id="select" value="전체보기">
</form>

<div>
  <canvas id="myChart"></canvas>
</div><br>

<form id="reg_frm" method="post">
	<div id="d1">
		<input type="hidden" name="mId" value="<%= mId %>">
		팔굽혀펴기 :&nbsp;<input type="text" id="PushNum" name="tPushNum" placeholder="팔굽혀펴기" size="15">&nbsp;
		윗몸일으키기 :&nbsp;<input type="text" id="SitupNum" name="tSitupNum" placeholder="윗몸일으키기" size="15">&nbsp;
		풀업 :&nbsp;<input type="text" id="PullupNum" name="tPullupNum" placeholder="풀업" size="15">&nbsp;
		달리기 :&nbsp;<input type="text" id="RunDist" name="tRunDist" placeholder="예) 3km = 3" size="15">&nbsp;
		날짜 :&nbsp;<input type="text" id="tDate" name="tDate" placeholder="예) 20231120" size="15">&nbsp;
		<input type="button" class="btn btn-outline-primary" value="기록하기" onclick="form_check()" >
	</div>
</form>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>

  const ctx = document.getElementById('myChart');
  
  const labels = [];
  const first = [];
  const second = [];
  const third = [];
  const four = [];
  var count = 0;
  var graphType = 'bar';
  
  <c:forEach items="${selData}" var="dto" varStatus="loop">
  labels.push('<c:out value="${dto.tDate}" />');
  first.push(<c:out value="${dto.tPushNum}" />);
  second.push(<c:out value="${dto.tSitupNum}" />);
  third.push(<c:out value="${dto.tPullupNum}" />);
  four.push(<c:out value="${dto.tRunDist}" />);
  count = count + 1;
  </c:forEach>
  
  if(count > 5) {
	  graphType = 'line';
  }
  
  new Chart(ctx, {
    type: graphType,
    data: {
      labels: labels,
      datasets: [{
        label: '# 팔굽혀펴기',
        data: first,
        borderColor: "#3e95cd",
        borderWidth: 1
      }, {
   	    label: '# 윗몸일으키기',
        data: second,
        borderColor: "#8e5ea2",
        borderWidth: 1
      }, {
     	label: '# 풀업',
        data: third,
        borderColor: "#3cba9f",
        borderWidth: 1
      }, {
    	label: '# 달리기',
        data: four,
        borderColor: "#e8c3b9",
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>
