<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/company.css?ver=2">
<title>우물밖개구리:out-frog</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="resources/js/jquery.animateNumber.js"></script>
<script type="text/javascript">
flag = 1;
$(document).ready(function() {
	$('#history').hide();
    $(window).scroll(function() {
    	if ( $( this ).scrollTop() > 50 && flag>0 ) {
	    	$('#count1').animateNumber({ number: 5 },2000);
	    	$('#count2').animateNumber({ number: 10000 },2000);
	    	$('#count3').animateNumber({ number: 300 },1800);
	    	
	    	flag = 0;
	    }
    	if ( $( this ).scrollTop() > 300 && flag==0 ) {
	    	$('#history').show(1000);
	    	flag = -1;
	    }
    });
});

</script>
</head>
<body>
	<div class="main">
    	<div class="lr10">
			<div class="title"><div class="title2">인사말</div></div><br>
                <div class="title1 blinking">우물 밖 개구리<br /></div>
                <div class="title5">뛰어난 능력, 가치있는 경험으로 당신과 함께 합니다 </div><hr>
                <div class="title3">사람과 사람을 중심으로 더 큰 내일을 만드는 광고 전문 중개사이트</div>
                <img src="resources/image/frog.png" alt="대표사진">
                <div class="title4">우물 밖 개구리는 광고 공모전이나 광고 의뢰 시 판매자(광고 제작자)와 구매자(공모 주최자)를 중개해주는 광고 중개 사이트 입니다.</div> 
            </div>
        </div> 
        <br><br><br><br><br>
    <table style="margin-left:10%">
    	<tr>
    		<th style="width:200px">우물밖개구리 사원 수</th>
    		<th style="width:200px"></th>
    		<th style="width:200px">공모작품 지원 수</th>
    		<th style="width:200px"></th>
    		<th style="width:200px">거쳐간 공모 수</th>
    	</tr>
    	<tr>
    		<th style="height:200px"><div class="circle"><p id="count1" style="font-size:30px">0</p></div></th>
    		<th></th>
    		<th style="height:200px"><div class="circle"><p id="count2" style="font-size:30px">0</p></div></th>
    		<th></th>
    		<th style="height:200px"><div class="circle"><p id="count3" style="font-size:30px">0</p></div></th>
    </table>
  	<br><br><br>
	<div class="main">
            <div class="lr10">
                <div class="title"><div class="title2">연혁</div></div><br>
                <span class="title5">열정과 도전의 여정</span>
                <span class="title1 blinking">HISTORY</span>
                <div style="font-size:20px">우리 회사의 역사를 소개합니다.</div><hr>
                <div id="history" class="history">
                    <div class="title5">2017</div>
                    <ol class="title6"> 
                    	<div class="bigImage">
                        <img style="width:180px; height:auto; float:left; margin-right:15px;" src="resources/image/frog.png" alt="단체사진" /></div>
                        <div style="font-size:24px">2017 11 . 06 ~</div><br><span style="font-size:20px">- 우물 밖 개구리 창설</span>
                    </ol>
                </div>
            </div>
		</div>
</body>
</html>