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
	<!-- 여기부터 -->
	<div id="img_wrap" class="animated">
		<h1>파이크 푸시업</h1>
		<hr>
		<img id="animated" src="/images/pushup/파이크 푸쉬업.gif">
		<hr>
		<h3>위 동작은 엉덩이를 치켜세워 머리를 땅으로 꽂는다는 느낌으로 운동합니다. 파이크 푸쉬업(Pike Push-up)은 가슴운동보다 
		어깨근육에 더 많은 자극이 가기에 삼각근 단련에 탁월합니다. 
		하지만 충분한 근력을 통하여 운동을 해야하기에 난이도가 높다 할 수 있습니다. 
		또한 인클라인 푸쉬업과 연계하여 더욱 많은 부위 자극이 가능합니다.
		이 운동을 수행할 때 주의해야 할 점은 다음과 같습니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 엎드려 시작합니다. 손을 어깨 너비로 벌리고 바닥에 펴 놓습니다.</h3>
		<h3>- 다리는 곧게 뻗어놓고 엉덩이는 하늘 쪽으로 들어올립니다.</h3>
		<h3>- 몸을 역 v자로 유지하도록 노력하세요. 엉덩이를 높이 들어올리는 것이 파이크 자세의 핵심입니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>클래식 푸시업</h1>
		<hr>
		<img id="animated" src="/images/pushup/클래식푸쉬업.gif">
		<hr>
		<h3>팔굽혀펴기는 자신의 체중으로 하기 때문에 아무런 운동기구 없이 할 수 있고 
		장소에 제약이 없다는 점에서 언제 어디서든 할 수 있습니다.
		가장 일반적인 팔굽혀펴기 효과는 대흉근 발달에 있으며, 
		가슴의 대흉근을 전체적으로 단련하며 삼두와 삼각근 중 전면 삼각근을 집중적으로 발달시킬 수 있는 동작입니다.</h3>
		<h3>머리부터 발끝까지 몸이 일직선이 되게 유지하고 운동을 진행해야 좋은 몸을 만들 수 있습니다!</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 모든 푸쉬업 동작을 하실 때 내려갈 때 호흡을 마시고 올라올 때 호흡을 뱉으면서 올라오시면 효과가 더 향상됩니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>인클라인 푸시업</h1>
		<hr>
		<img id="animated" src="/images/pushup/인클라인 푸쉬업.gif">
		<hr>
		<h3>인클라인 푸쉬업은 상체를 벤치 위에 두고 하는 푸쉬업입니다. 
		이 팔굽혀펴기 효과는 디클라인 푸쉬업 반대로 아랫가슴을 발달시키는 것으로, 높이에 따라서 아랫가슴의 발달 정도가 달라집니다. 
		운동하고 싶은 부위에 힘이 들어가는지, 자극이 오는지 느끼면서 힘이 안들어가거나 자극이 안오면 힘을 주고 
		자극 느낌을 확인 하면서 진행을 뛰어난 도움이 됩니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 쉽다고 팔힘으로 하는 것보다는 가슴 근육을 이용해서 미시는 것을 권장합니다.</h3>
		<h3>- 반드시 고정이 되어 잇는 물체에 손을 짚고 하셔야 합니다.</h3>
		<h3>- 움직일 수도 있는 물체에 손을 짚고 하시면 부상의 위험이 있습니다!</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>디클라인 푸시업</h1>
		<hr>
		<img id="animated" src="/images/pushup/디클라인 푸쉬업.gif">
		<hr>
		<h3>인클라인 푸쉬업과 반대로 발을 의자나 책상 같은 것에 올려두고 진행하는 자세로써 어깨와 팔에 무게가 쏠리기 때문에 상당히 어려운 자세입니다.
		가슴 상부 근육과 어깨에 자극을 주므로 윗가슴 근육과 어깨 근육을 키우고 싶으신 분들에게 추천드리는 자세입니다.</h3>
		<h3>올려둔 발 높이가 높아질수록 상부에 자극이 더 오게 되고 난이도 또한 높아집니다. </h3>
		<h3>처음에는 무릎 높이 정도 오는 물체에 발을 올려두고 시작해서 익숙해지면 점차적으로 발 높이를 높이시는 것을 추천드립니다!</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 삼두까지 중점적으로 자극을 주고 싶다면 디클라인 푸쉬업 자세에서 손을 안쪽으로 모아서 하시면 삼두에도 자극이옵니다.</h3>
		<h3>- 고혈압이신 분들은 피가 머리로 쏠리기 때문에 이 자세를 지양합니다!</h3>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>