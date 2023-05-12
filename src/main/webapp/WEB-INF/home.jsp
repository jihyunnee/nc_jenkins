<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<style>
	body, body *{
		font-family: 'Jua'
	}
	
	
</style>
</head>
<body>
	리즈의 번역 사이트
	
	<h2> 즐거운 그묘일~!</h2>
	
	<div>
		<textarea style="width : 100%" class="form-control" id="msg">
		번역을 원하는 텍스트를 입력하세용
		</textarea>
	</div>
	<div class="input-group">
		<select id="seltrans" class="form-select">
			<option value="en">영어</option>
			<option value="zh-CN">중국어</option>
			<option value="ja">일어</option>
			<option value="es">스페인어</option>
			<option value="de">독일어</option>
			<option value="fr">프랑스어</option>
			<option value="it">이탈리아어</option>
			
		</select>
		<button type="button" id="btntrans" class="btn btn-danger">번역하기</button>
		<br><br><br><br>
		<fr>
		<div>
		<i class="bi bi-megaphone voicespeak" style="font-size:30px"></i><br>소리
		</div>
	</div>
	<div id="trans"></div>
	
<script type="text/javascript">
	$("#btntrans").click(function(){
		let msg = $("#msg").val();
		
		let lang= $("#seltrans").val();
		
		$.ajax({
			type:"post",
			url:"./trans",
			data:{"msg":msg,"lang":lang},
			dataType:"text",
			success:function(res)
			{
				let j = JSON.parse(res);
				//번역한 문자열을 얻는다
				let s=j.message.result.translatedText;
				
				$("#trans").html(s);
			}
		})
		
	})
	//스피커 클릭시
	$(".voicespeak").click(function(){
		let msg = $("#trans").text();		
		let lang= $("#seltrans").val();
		
		if(lang=='en'||lang=='ja'||lang=='es'||lang=='ko'||lang=='zh-CN'){
		
		$.ajax({
			type:"get",
			url:"./voice",
			data:{"msg":msg,"lang":lang},
			dataType:"text",
			success:function(res)
			{
				let audio = new Audio(res);
				audio.play();
				
			}
		});
		}else{
			alert("아직 기능 구현하고 있어용")
		}
		
	})

</script>	
</body>
</html>
