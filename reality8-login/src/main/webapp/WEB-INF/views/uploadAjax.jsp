<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.uploadResult{
	width: 100%;
	background-color: pink;
}
.uploadResult ul{
	display: flex;
	felx-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadResult ul li{
	list-style: none;
	padding: 10px;
}
.uploadResult ul li img{
	width: 20px;
}
</style>

</head>
<body>
<h1>Upload with Ajax</h1>
<div class="uploadDiv">
	<input type='file' name='uploadFile' multiple>
</div>
<div class="uploadResult">
	<ul>
	<!-- json형태로 업로드된 결과를 받았는데 이를 파일 아이콘 등을 화면에 띄어 결과 피드백 위한 자리 -->
	</ul>
</div>
<button id='uploadBtn'>Upload</button>

<script
	src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	
<script>
$(document).ready(function(){
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 종류 파일 업로드할 수 X");
			return false;
		}
		return true;
	}
	
	var cloneObj = $(".uploadDiv").clone();
	
	//화면에 파일 출력
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(function(i, obj){
			
			console.log('image type', obj.image);
			if(!obj.image){
				var fileCallPath = encodeURIComponent(obj.uploadPath + "\\" + obj.fileName);
				str += "<li><a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'>" + obj.fileName +"</a></li>";
			} else{
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.fileName);
				str += "<li><img src='/imagethumbnail?fileName=" + fileCallPath + "''</li>";
			}
		});
		uploadResult.append(str);
	}
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
				type: 'POST',
				dataType: 'json', //브라우저에 json데이터형식으로 전달
				success: function(result){
	
					console.log('------');
					console.log('전송결과',result);
					console.log('전송결과',JSON.stringify(result));
					console.log('전송결과 typeof',typeof result);
					console.log('전송결과 typeof',typeof JSON.stringify(result));
					
					console.log('-----');
					//console.log('전송결과',result.fileName);
					console.log('전송결과'+result[0].fileName);
					console.log('전송결과'+result[0].image);
					showUploadedFile(result);
					//showUploadedFile(JSON.stringify(result));
					
					//첨부파일 업로드 후 초기화시킴
					$(".uploadDiv").html(cloneObj.html());
			}
		});
	}); //end $.ajax
	

});
</script>	 
</body>
</html>