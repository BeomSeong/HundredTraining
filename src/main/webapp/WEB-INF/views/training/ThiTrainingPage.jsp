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
		<h1>오버그립 풀업</h1>
		<hr>
		<img id="animated" src="/images/pullup/오버그립 풀업.gif">
		<hr>
		<h3>모두가 아는 기본적인 운동법으로, 아래는 운동방법입니다. 
		양 손바닥이 자신의 앞을 본 상태에서 봉을 쥐는 형태이며 팔꿈치가 향하는 방향과 손바닥이 향하는 방향이 같습니다.
		보통 풀업이라고 하면 오버그립 풀업을 의미합니다.</h3>
		<h3>광배근을 가장 많이 활성화하는 운동이며 그와 반대로 승모근을 자극하는 정도는 비교적 낮아 등 상부와 두께 발달을 위해서는 
		중부, 하부 승모근 운동을 추가로 해주는 것이 좋습니다.</h3>
		<h3></h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 어깨 넓이로 바를 잡는고 상체를 고정하여 숨을 뱉으며 등을 수축하면서 올라갑니다.</h3>
		<h3>- 그 다음 숨을 들이 마시며 등의 자극을 느끼며 천천히 내려와 줍니다.</h3>
		<h3>- 몸의 상승과 하강때 몸이 약간 뉘어진다는 느낌으로 하는것이 견갑 움직임과 광배 움직임을 잘느낄수 있다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>언더그립 친업</h1>
		<hr>
		<img id="animated" src="/images/pullup/언더그립 친업.gif">
		<hr>
		<h3>친업은 손바닥이 나를 보도록 잡아준 상태에서 턱걸이를 수행하는 것입니다.
		턱걸이를 처음 배우기 시작할때 많이 하는 방법으로 오버그립보다 훨씬 쉽게 동작이 가능합니다. 
		그 이유는 이두의 개입을 통하여 추가적인 힘을 낼 수 있기 때문입니다. 특히 광배근 하부에 뛰어난 효과를 보여주는 운동입니다.</h3>
		<h3>그리고 지속적으로 견갑이 활성화되는 턱걸이 종류에 속하기 때문에 어깨의 프레임을 넓히는데 큰 도움이 됩니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 양팔을 펴서 손바닥이 나를 바라보도록 어깨너비보다 살짝 더 넓게 바를 잡아주세요.</h3>
		<h3>- 몸의 중심이 흔들리지 않도록 코어에 힘을 넣고 복압을 유지해주세요.</h3>
		<h3>- 팔꿈치를 편 상태에서 가슴을 펴고 숄더 패킹을 한 상태에서 가슴을 위쪽으로 당겨줍니다.</h3>
		<h3>- 최대로 끌어올린 상태에서 잠깐 멈췄다가 호흡을 들이마시면서 내려옵니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>내로우 풀업</h1>
		<hr>
		<img id="animated" src="/images/pullup/내로우 풀업.gif">
		<hr>
		<h3>어깨넓이보다 훨씬 좁게 잡아서 실행하는 턱걸이입니다. 광배근을 최대한 수축과 이완이 가능한 운동입니다. 
		기본 턱걸이를 진행하다가 더 운동을 진행하고 싶을시에 진행해주면 효과적입니다.</h3>
		<h3>내로우 풀업을 하면 주로 등의 중심부에 자극이 가고 넓게 그립을 잡을수록 등의 좌우 옆부분이 자극됩니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 광배근에 집중하여 턱이 풀업바에 닿거나, 손이 가슴 상부에 닿을때까지 몸을 당겨 올리도록 합니다.</h3>
		<h3>- 천천히 내려오며 10회씩 7세트 반복합니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>와이드 풀업</h1>
		<hr>
		<img id="animated" src="/images/pullup/와이드 풀업.gif">
		<hr>
		<h3>어깨가 넓은 효과를 내려면 사람의 기본 골격은 정해져있기에 견갑골을 바깥으로 빼줘야 합니다. 
		그 운동은 바로 어깨 운동이 아니라 등 운동이며 실제로 등이 넓어보이려면 어깨 운동이 아닌 등 운동을 진행해주셔야 합니다. 
		그렇게 날개뼈를 빼주어 어깨깡패를 만들어주는 운동이 바로 와이드 풀업 입니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 풀업바를 어깨보다 넓게 손으로 잡고 메달려줍니다.</h3>
		<h3>- 가슴을 위로 올려주며 날개뼈(견갑)을 당겨 고정시킨다.</h3>
		<h3>- 그상태에서 가슴을 바에 닿게 올린다는 느낌으로 당겨줍니다.</h3>
		<h3>- 팔꿈치가 지나치게 앞쪽으로 위치하게되면 이두근과 어깨의 개입이 높아지며 등의 개입이 현저히 떨어집니다.</h3>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>
</body>
</html>