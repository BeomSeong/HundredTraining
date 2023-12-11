<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exercise Info</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<style>
	#img_wrap {
        text-align: center;
        background-color: #fff;
        border: 2px solid #000;
        padding: 20px;
        border-radius: 10px;
        margin-top: 20px;
    }

    #img_wrap img {
        width: 100%;
        height: auto;
        border-radius: 5px;
        margin-top: 20px;
    }

    #img_wrap h1 {
        font-size: 40px;
        color: #333;
        margin-bottom: 20px;
        font-weight: bold;
    }

    #img_wrap h2 {
        font-size: 28px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }

    #img_wrap h3 {
        font-size: 18px;
        color: #555;
        margin-top: 10px;
    }

    #img_wrap hr {
        border: 1px solid #ddd;
        margin: 20px 0;
    }

	h1 {
		color:white;
		background-color: #00a495;
		text-align:center;
	}
	
	h2 {
		color:red;
		text-align:center;
	}
	
	.animated #animated {
		display: inline;
	}
</style>
<script>
	$(function() {
		$('#img_wrap').on( 'mouseenter', function() {
			$(this).toggleClass('animated', 'static');
		})
	})
</script>
</head>
<body>
<div class="container">
<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="img_wrap" class="animated">
		<h1>조깅</h1>
		<hr>
		<img id="animated" src="/images/running/조깅.gif">
		<hr>
		<h3>조깅은 가볍게 뛰는 달리기라고 생각하시면 되며, 걷는 속도의 1.5~2배 정도의 속도로 달리시면 됩니다.
		시간은 30~50분 정도로 주 3회 정도 반복하시는 것을 권장하고 점차 자신의 몸 상태에 맞추어서 달리기의 속도나 시간을 늘리시는 게 가장 좋습니다.
		가장 보편적으로 다이어트에 효과적인 운동법입니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 상체와 어깨에 힘을 빼고 가슴을 자연스럽게 편 자세를 유지합니다.</h3>
		<h3>- 발뒤꿈치부터 착지를 시작하여 발바닥 전체로 몸을 지지하고, 마지막으로 엄지발가락으로 차고 나갑니다.</h3>
		<h3>- 착지 시에는 무릎을 조금 굽혀야 충격을 흡수하고, 줄일 수 있습니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>인터벌</h1>
		<hr>
		<img id="animated" src="/images/running/인터벌.gif">
		<hr>
		<h3>인터벌은 중간의 휴식까지 넣어서 하는 운동을 통틀어 인터벌 트레이닝 이라고 합니다.
		중,장거리 달리기에서 많이 사용되는 운동법입니다.
		고강도 인터벌 트레이닝을 시작할 때 이미 아는 방법을 5~7분간의 루틴을 진행할 것을 권장하며</h3> 
		<h3>단기간에 높은 운동 효과를 누릴 수 있는 운동법입니다. 중간중간에 휴식 시간을 가져주며, 
		여기서 휴식은 완전히 멈춰서 쉬는것이 아니라 천천히 뛰는 것을 의미합니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 훈련을 주 2회를 넘는 것은 무리가 될수 있어 적절한 휴식과 스케줄을 정해놉니다.</h3>
		<h3>- 운동 직후 몸에 열이 있는 상태에서 뜨거운 물로 샤워를 하면 열을 더 올릴 수 있어 찬물 샤워가 좋습니다.</h3>
		<h3>- 인터벌 속도와 시간을 정해놓고 수행하는것이 효과적입니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>스프린트</h1>
		<hr>
		<img id="animated" src="/images/running/스프린트.gif">
		<hr>
		<h3>스프린트는 주로 단거리 달리기에서 사용되는 주법입니다.
		짧은 거리를 빠른 시간 안에 주파하거나 반대로 짧은 시간 안에 최대한 멀리 가는데 목적이 있는 달리기입니다.
		달리는 방법은 본인이 낼 수 있는 최고의 속도로 전력질주 하시면 됩니다.</h3>
		<h3>둔근과 발목 강화에 많은 도움이 되며 고관절 근육에 대한 활성도가 증가해 근력과 파워를 올리기에 탁월한 운동법입니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 동적인 스트레칭을 해주어 근육을 풀어주는 동시에 심장 박동수를 올려주는것이 단기간 운동의 효과적입니다.</h3>
		<h3>- 처음 10미터 정도는 몸을 지면에 낮게 유지하는 것이 점차 상승하는 상체를 대비하기에 좋습니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>마라톤</h1>
		<hr>
		<img id="animated" src="/images/running/마라톤.gif">
		<hr>
		<h3>42.195 ㎞를 달리는 초 장거리 달리기로 현존하는 달리기 종목 중 
		그 거리가 가장 긴 종목이자 올림픽 육상에서 혼자 가장 먼 거리를 이동해야 하는 종목이다.
		지구력이 중요한 종목으로, 단순히 지구력만이 아니라 끈기로 대표되는 정신력 역시 중요한 요소이다.</h3>
		<h3></h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 처음에는 코로, 거리가 멀어짐에 따라서 입으로 호흡을 한다. 달리는 리듬에 맞춰서 규칙적으로 하되, 
		일반적으로 2-3보간 들이마시고 2-3보간 내쉬는 방법을 사용하기도 합니다.</h3>
		<h3>- 긴 거리를 체력에 맞게 일정한 속도를 유지하면서 달리기 능력을 최대한 발휘할 수 있도록 조절해야 합니다.</h3>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>

</body>
</html>