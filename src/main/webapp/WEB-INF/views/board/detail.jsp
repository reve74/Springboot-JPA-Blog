<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<button class="btn btn-secondary" onclick="history.back()">돌아가기</button>
	<c:if test="${board.user.id == principal.user.id}">
		<a href="/board/${board.id}/updateForm" class="btn btn-warning">수정</a>
		<button id="btn-delete" class="btn btn-danger">삭제</button>
	</c:if>
	<br> <br>
	<div>
		글 번호: <span id="id"><i>${board.id }</i></span> 작성자: <span><i>${board.user.username}</i></span>
	</div>
	<br>
	<div>
		<h3>${board.title }</h3>
	</div>
	<hr>
	<div>
		<div>${board.content }</div>
	</div>
	<hr>
</div>



<script type="text/javascript">
let index = {
		init: function(){
			$("#btn-save").on("click", ()=>{ 
				this.save();
			});
			$("#btn-delete").on("click", ()=>{ 
				this.deleteById();
			});
			$("#btn-update").on("click", ()=>{ 
				this.update();
			});
			$("#btn-reply-save").on("click", ()=>{ 
				this.replySave();
			});
		},

		save: function(){
			let data = {
					title: $("#title").val(),
					content: $("#content").val()
			};
			
			$.ajax({ 
				type: "POST",
				url: "/api/board",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp){
				alert("글쓰기가 완료되었습니다.");
				location.href = "/";
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
		
		deleteById: function(){
			let id = $("#id").text();
			
			$.ajax({ 
				type: "DELETE",
				url: "/api/board/"+id,
				dataType: "json"
			}).done(function(resp){
				alert("삭제가 완료되었습니다.");
				location.href = "/";
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
		
		update: function(){
			let id = $("#id").val();
			
			let data = {
					title: $("#title").val(),
					content: $("#content").val()
			};

			$.ajax({ 
				type: "PUT",
				url: "/api/board/"+id,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp){
				alert("글수정이 완료되었습니다.");
				location.href = "/";
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
		
		replySave: function(){
			let data = {
					userId: $("#userId").val(),
					boardId: $("#boardId").val(),
					content: $("#reply-content").val()
			};
			
			$.ajax({ 
				type: "POST",
				url: `/api/board/${data.boardId}/reply`,
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json"
			}).done(function(resp){
				alert("댓글작성이 완료되었습니다.");
				location.href = `/board/${data.boardId}`;
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
		
		replyDelete : function(boardId, replyId){
			$.ajax({ 
				type: "DELETE",
				url: `/api/board/${boardId}/reply/${replyId}`,
				dataType: "json"
			}).done(function(resp){
				alert("댓글삭제 성공");
				location.href = `/board/${boardId}`;
			}).fail(function(error){
				alert(JSON.stringify(error));
			}); 
		},
}

index.init();

</script>

<%@ include file="../layout/footer.jsp"%>