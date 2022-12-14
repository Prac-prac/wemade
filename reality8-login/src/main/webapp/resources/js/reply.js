console.log("Reply Module...");
var replyService = (function(){
	
	//add
	function add(reply, callback, error){
		console.log("add reply....");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	
	//getList
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
			function(data){
				if(callback){
					//댓글 목록만 가져오는 경우 
					//callback(data);
					
					//댓글 숫자와 목록 - replyPageDTO로 바뀜
					callback(data.replyCnt, data.list);
				}
			}).fail(function(xhr, status, err){
					if(error){
						error();
					}
				});
			} 
			
			
	//remove
	function remove(rno, callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}		
	
	
	//update
	function update(reply, callback, error){
		console.log("RNO: "+ reply.no);
		
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er)
				}
			}
		});
	}
	
	
	//특정 번호의 댓글 조회는 get방식으로 동작하므로?
	//get
	function get(rno, callback, error){
		$.get("/replies/" + rno + ".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	
	//xml, json형태일 때 숫자로 표현되는 시간 값 바꿔주기
	//displayTime
	function displayTime(timeValue){
		//alert("displayTime 열렷다");
		//console.log("적용완료영");
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";
		
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9? '' : '0') + hh, ":", (mi > 9? '' : '0') + mi, ":", (ss > 9? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9? '' : '0') + mm, '/', (dd > 9? '' : '0') + dd].join('');
		}
	};
	
	return {
		add: add,
		getList : getList,
		remove: remove,
		update: update,
		get: get,
		displayTime: displayTime
	};
})();