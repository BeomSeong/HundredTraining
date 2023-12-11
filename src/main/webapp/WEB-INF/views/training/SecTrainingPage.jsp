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
		<h1>윗몸 일으키기</h1>
		<hr>
		<img id="animated" src="/images/situp/윗몸일으키기.gif">
		<hr>
		<h3>윗몸 일으키기(Sit-Up)는 누운 상태에서 양 손을 머리뒤에 깍지를 낀 상태로 다리는 고정시키고 
		상체를 앞으로 굽혔다가 팔꿈치가 무릎을 닿고 다시 내려가는 것을 반복하는 운동입니다.
		흔히 복근 운동의 대표주자로 알려져있지만, 복근보다도 허리나 하체, 팔 등에 들어가는 힘이 더 많기 때문에 
		복근만이 아니라 장요근이 주 타깃이며 운동 효과 자체는 좋아서 허리를 비롯 신체 전반적인 지구력을 키우는 데 효과적입니다.</h3>
		<h3>윗몸일으키기를 하기 전에 부상의 위험을 줄이기 위해 근육을 적절히 스트레칭 해주세요.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 운동 매트 위에 바닥에 평평하게 누워 발목을 90도 굽힌 상태를 유지합니다. 발도 평평하게 유지하고 팔을 바닥에서 약간 들어 올립니다.</h3>
		<h3>- 코어에 힘을 주고 바닥에서 몸을 일으키되 엉덩이와 발은 바닥에 고정합니다.</h3>
		<h3>- 위로 부드럽게 움직인 다음 반대 방향으로 움직입니다. 허리도 공중에 떠 있어야 합니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>크런치</h1>
		<hr>
		<img id="animated" src="/images/situp/크런치.gif">
		<hr>
		<h3>크런치는 가장 기본적인 복근 운동으로 윗몸일으키기를 할때 허리통증이 발생하는 코어가 약한 분들이
		가장 쉽게 접근할 수 있는 상복부를 만들어 주는 복근 운동입니다.</h3>
		<h3>크런치 운동은 윗몸 일으키기와 비슷해보이지만 상체를 완전히 올리지 않고 살짝만 올려준다는 차이점이 있습니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 바다에 누워서 다리를 고정시키고 시선은 천장을 바라봅니다.</h3>
		<h3>- 골반을 살짝 말아주어 복부에 힘을주고 등이 바닥에서 살짝 떨어지고 허리가 바닥에서 뜨지 않도록 준비자세를 취해주세요.</h3>
		<h3>- 시선이 천장을 바라보며 복근을 힘껏 수축시켜 상반신을 적당히 들어올립니다.</h3>
		<h3>- 다시 천천히 버티며 내려와 준비자세로 돌아갑니다.</h3>
		<h3>- 10~20회 정도로 5셋트 정도 실시해줍니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>트위스트</h1>
		<hr>
		<img id="animated" src="/images/situp/트위스트.gif">
		<hr>
		<h3>다양한 싯업 종류가 있지만 옆구리에 효과가 좋은 운동법입니다. 
		무릎을 구부린 채로 바닥에 앉아 복근에 힘을 주어 척추 방향으로 당깁니다.
		그리고 발이 바닥에서 떨어질 때까지 서서히 뒤로 젖힙니다. 그런 다음 몸통을 오른쪽으로 틀었다가 다시 왼쪽으로 틀기를 반복해줍니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 몸을 수건짜듯이 좌우로 틀어서 외복사근을 짜듯이 수축해줍니다.</h3>
		<h3>- 뒤로 너무 누워서 허리가 펴지지 않도록 해줍니다.</h3>
		<h3>- 코어 활성화와 옆구리 자극을 통해 소화기 운동이 원활해져 변비에 도움이 됩니다.</h3>
		<hr>
	</div>
	<br>
	<div id="img_wrap" class="animated">
		<h1>리버스 크런치</h1>
		<hr>
		<img id="animated" src="/images/situp/리버스 크런치.gif">
		<hr>
		<h3>리버스 크런치는 상복부와 하복부를 동시에 자극할 수 있는 운동입니다.
		크런치와 반대되는 동작으로 상체를 들어올리는 대신 다리를 들어올림으로써 하복부를 강화할수 있습니다.
		다리를 들었을 때 엉덩이와 허리까지 들어올려야 하고, 초보자에겐 조금 어려운 운동 자세일 수 있으니
		크런치로 복부의 힘을 길러주신 다음 하는것이 좋습니다.</h3>
		<hr>
		<h2>< 운동 TIP ></h2>
		<h3>- 매트에 누워 균형을 유지하기 위해 양팔을 펴고 엉덩이 옆에 손바닥으로 바닥을 살짝 눌러주세요.</h3>
		<h3>- 허벅지가 바닥과 수직이 되도록 하고 무릎을 구부려 90도로 만들어주세요.</h3>
		<h3>- 하복부에 힘을주어 엉덩이를 들어올리며 무릎이 가슴쪽으로 들어오도록 골반을 말아줍니다.</h3>
		<h3>- 하복부에 힘을주고 버티면서 다시 준비자세로 돌아갑니다.</h3>
	</div>
<jsp:include page="../main/footer.jsp"></jsp:include>
</div>

</body>
</html>