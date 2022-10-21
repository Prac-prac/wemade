<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           
                           		<div class="form-group">
                           			<label>Bno</label>
                           			<input class="form-control" name='bno'  value='<c:out value="${board.bno }"/>' readonly="readonly">                   		
                         		</div>
                           		<div class="form-group">
                           			<label>Title</label> 
                           			<input class="form-control" name='title'  value='<c:out value="${board.title }"/>' readonly="readonly">
                           		</div>
                           		<div class="form-group">
                           			<label>Text area</label> 
                           			<textarea class="form-control" rows="3" name='content'  readonly="readonly"><c:out value="${board.content }" /></textarea>
                           		</div>
                           		<div class="form-group">
                           			<label>Writer</label> 
                           			<input class="form-control" name='writer' 
                           			value='<c:out value="${board.writer }"/>'  readonly="readonly">
                           		</div>
                           		<button data-oper='modify' class="btn btn-default"
                           			onclick="location.href='/board/modify?bno=<c:out value="${board.bno }" />' " >Modify</button>
                          		<button data-oper='list' class="btn btn-info"
                          			onclick="location.href='/board/list' " />Return to List</button>
                        
                           <form id='operForm' action="/board/modify" method="get">
                           		<input type="hidden" id='bno' name='bno' value='<c:out value="${board.bno }" />'>
                           		
                           		      <!-- modify.jsp에도 추가할 건데 list 넘어갈 때 페이지 번호 기억해 그 페이지로 가기 위해 -->
                           		<input type="hidden"  name='pageNum' value='<c:out value="${cri.pageNum }" />'>
                           		<input type="hidden"  name='amount' value='<c:out value="${cri.amount }" />'>
                           		<input type="hidden"  name='type' value='<c:out value="${cri.type }" />'>
                           		<input type="hidden"  name='keyword' value='<c:out value="${cri.keyword}" />'>
  
                           </form>                           
                           
                           
                           
                           
                           
                           
                           
                        </div>
                        <!-- end panel-body -->
                    </div>
            <!-- end panel -->
        	 </div>
        </div>
        <!-- /.row -->

		
		
		
		<!-- 첨부파일 -->
		<div class='bigPictureWrapper'>
			<div class='bigPicture'>
			</div>
		</div>
		
		<style>
		.uploadResult {
		width:100%;
		background-color : gray;
	}
	.uploadResult ul {
		display:flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	.uploadResult ul li img{
		width: 100px;
	}
	.uploadResult ul li span{
		color:white;
	}	
	.bigPictureWrapper{
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background: rgba(255, 255, 255, 0.5);
	}
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.bicPicture img{
		width: 600px;
	}
</style>	
		
		<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Files
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
		
							<div class='uploadResult'>
								<ul>
								</ul>
							</div>
							
						 </div>
                        <!-- end panel-body -->
                    </div>
            <!-- end panel -->
        	 </div>
        </div>
        <!-- /.row -->
							
		
		
		<!-- 댓글 -->
		<div class='row'>
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>Reply
						<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
					</div>
					
					<div class="panel-body">
						<ul class="chat">
							<li class="left clearfix" data-rno='12'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong>
										<small class="pull-right text-muted">2022-08-01 15:37</small>
									</div>
									<p>Good job!</p>
								</div>
							</li>
						</ul>
					</div>
					
					
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>




<!-- 댓글 모달창 띄워 거기서 작성해 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="trure">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<input class="form-control" name='reply' value='New Reply!!'>
				</div>
				<div class="form-group">
					<label>Replyer</label>
					<input class="form-control" name='replyer' value='replyer!!'>
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name='replyDate' value=''>
				</div>
			</div>
		<div class="modal-footer">
			<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
			<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
			<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
			<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		</div>
		</div>
	</div>
</div>


<%@include file="../includes/footer.jsp" %>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		//데이터 필요 없으니까 지우고 감
		operForm.find("#bno").remove();

		operForm.attr("action", "/board/list");
		operForm.submit();
	});
});

$(document).ready(function(){
	console.log("Js test");
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
	
	//add
//	replyService.add(
//		{reply : "Js test", replyer: "tester", bno : bnoValue}
//		,
//		function(result){
//			alert("RESULT: " + result);
//		}
//	);
	
	
	//getList
	replyService.getList({bno: bnoValue, page : 1}, function(list){
		for(var i=0, len=list.length||0; i<len; i++){
			console.log(list[i]);
		}
	});
	
	
	
	//remove
	//replyService.remove(66, function(count){
	//	console.log(count);
		
	//	if(count === "success"){
	//		alert("REMOVED");
	//	}
//	}, function(err){
//		alert("It's remove ERROR");
//	});
	
	
	//update
//replyService.update({
//		rno : 75,
//		bno : bnoValue,
//		reply : "Modified Reply....//"
//	}, function(result){
//		alert("수정 완료 //");
//	});
	
	
	//get
//	replyService.get(75, function(data){
//		alert("get ok!~!")
//		console.log(data);
//	});
	
	
	//조회 페이지 열리면(get.jsp) 자동으로 댓글 목록 가져와 <li>태그 구성
	showList(1);
	
	
	//bno에 따른 전체 댓글 여는 함수
	function showList(page){
		
		replyService.getList({bno : bnoValue, page : page||1}, 
				
			function(replyCnt, list){
			
				if(list == null || list.length == 0){
					replyUL.html("");
					return;
				}
				
				//사용자가 새로운 댓글 추가 시 showList(-1); 호출
				if(page == -1){
					pageNum = Math.ceil(replyCnt/10.0); //마지막 페이지 찾아서 다시 호출
					showList(pageNum)
					return;
				}
				
				var str="";
				for(var i=0, len=list.length||0; i<len; i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str +="      <p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				
				
				//댓글 페이지 번호 
				showReplyPage(replyCnt);
		
		}); //end function
	} //end function showList
	
	
	
	
	//댓글 모달창 열기
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		modalRegisterBtn.show();
		$(".modal").modal("show");
	});
	
	modalRegisterBtn.on("click", function(e){
		var reply = {
			reply : modalInputReply.val(),
			replyer : modalInputReplyer.val(),
			bno : bnoValue
		};
		replyService.add(reply, function(result){
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			
			showList(-1);
		});
	});
	
	
	//댓글 클릭 이벤트 처리 - 이벤트 위임
	//ul 태그의 클래스 chat에 이벤트 걸지만, 실제 이벤트 대상은 li태그
	$(".chat").on("click", "li", function(e){
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply){
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
			modal.data("rno", reply.rno); //수정과 삭제에 필요하니 rno(댓글번호)는 'data-rno'속성 만들어 추가
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		
		});
	});
	
	
	//댓글 수정
	modalModBtn.on("click", function(e){
		var reply = {rno : modal.data("rno"), reply : modalInputReply.val()};
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum); //다시 댓글 목록 갱신
		});
	
	});
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e){
		replyService.remove(modal.data("rno"), function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum); //다시 댓글 목록 갱신
		});
	
	});
	
	
	//댓글 페이지 번호
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum/10.0)*10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		if(endNum * 10 < replyCnt){
			next = true;
		}
		var str = "<ul class='pagination pull-right'>";
		
		if(prev){
			str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
		}
		for(var i = startNum; i <= endNum; i++){
			var active = pageNum == i? "active" : "";
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		if(next){
			str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
		}
		str += "</ul></div>";
		
		replyPageFooter.html(str);
	}
	
	
	//댓글 페이지 번호 클릭했을 때 새로운 댓글 가져오도록
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		var pageNum = $(this).attr("href");
		showList(pageNum);
	});
	
	
	
});


</script>

<script>
$(document).ready(function(){
	//첨부파일
	
	(function(){
		var bno = '<c:out value="${board.bno}"/>';
	
	
	$.getJSON("/board/getAttachList", {bno: bno}, function(arr){
		console.log(arr);
		var str ="";
		$(arr).each(function(i, attach){
			//image type
			if(attach.fileType){
				var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.fileName);
				str += "<li data-path='" + attach.uploadPath +"' data-uuid='" + attach.uuid +"' data-fileName='" + attach.fileName+"' data-type='"+attach.fileType+"'><div>";
				str += "<img src='/display?fileName=" + fileCallPath + "'>";
				str += "</div></li>";
			} else {
				str += "<li data-path='" + attach.uploadPath +"' data-uuid='" + attach.uuid +"' data-fileName='" + attach.fileName+"' data-type='"+attach.fileType+"'><div>";
				str += "<span >" + attach.fileName + "</span><br>";
				str += "<img src='/resources/img/attach.png'>";
				str +="</div></li>";
			}
		});
		$(".uploadResult ul").html(str);
	}); //end getjson
	})(); //end function
	
	$(".uploadResult").on("click", "li", function(e){
		console.log("view image"); 
		var liObj = $(this);
		var path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("filename"));
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g), "/"));
		} else {
			self.location = "/download?fileName=" + path
		}
	});
	
	//클릭 시 확대된 원본 이미지창 닫기
	$(".bigPictureWrapper").on("click", function(e){
		$(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
		setTimeout(function(){
			$('.bicPictureWrapper').hide();
		}, 1000);
	});
	
	function showImage(fileCallPath){
		$(".bigPictureWrapper").css("display", "flex").show();
		$(".bigPicture").html("<img src='/display?fileName=" + fileCallPath + "'>").animate({width: '100%', height: '100%'}, 1000);
	}
});
</script>