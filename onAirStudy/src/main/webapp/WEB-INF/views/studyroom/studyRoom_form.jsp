<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
	function studyroomValidate() {
		var $content = $("[name=content]");
		if (/^(.|\n)+$/.test($content.val()) == false) {
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}

	$(function() {
		$("[name=upFile]").on("change", function() {
			var file = $(this).prop('files')[0];
			var $label = $(this).next(".custom-file-label");

			if (file == undefined)
				$label.html("파일을 선택하세요");
			else
				$label.html(file.name);
		});
	});
</script>


<div class="newstudygroup" style="margin-bottom: 0;">


	<div class="row">
		<div class="col-sm p-4" style="background-color: #FBF7FD;">
			<h2 class="text-gray" style="float: left; padding-right: auto;">
				New Study Group</h2>
			<br />

			<hr>
			<div class="container">
				<div class="col-sm-9 pt-5 pb-4 bg-white">
					<h2>Study Group</h2>
					<hr>
					<br>
					<form action="${ pageContext.request.contextPath }/mypage1/insrtStudyList.do"
						id="insrtRoomFrm" method="POST">
						<div class="col-sm p-4"
							style="background-color: #F9F1ED; border-radius: 15px; border: 2px solid #AD8686;">
							<label for="groupCategory" style="margin-left: 6%;">
							<h5>카테고리 먼저 선택 후 확인을 눌러 주세요.</h5></label>
							<div class="row">
								<select class="custom-select" id="groupCategory" name="sellist1"
									style="width: 75%; margin-left: 7%;">
									<c:forEach items="${sCategory}" var="cate">
										<option id="srCategory" value="${cate.no}">${cate.category}</option>
									</c:forEach>
								</select>
							
								<input type="text" name = "memberId" value="${ loginMember.memberId }" hidden>
								<button type="submit" class="btn btn-light btn-sm"
									style="margin-left: 5%; border: 2px solid #AD8686;">확인</button>
							</div>
							<br />
						</div>
					</form>
					
					
					<form name="studyFrm"
						action="${pageContext.request.contextPath}/mypage1/newstudyEnroll.do"
						method="post" enctype="multipart/form-data"
						onsubmit="return studyroomValidate();">
						<div class="col-sm p-4"
							style="background-color: #F9F1ED; border-radius: 15px; border: 2px solid #AD8686;">
							<label for="gruopName"><h4>그룹이름</h4></label> <input type="text"
								class="col-lg-10" name="srTitle" id="srTitle"
								style="border-radius: 15px;"> 
								<input type="text"class="form-control" id="memberId" name="memberId" value="${ loginMember.memberId }" hidden> 							
						</div>
						
						<br />
						
						<div class="col-sm p-3 list-inline">
							<h4 class="list-inline-item">모집 인원</h4>
							<h4 class=" list-inline-item">총 10명</h4>
							<hr />
						</div>
						
						<div class="col-sm p-4"
							style="background-color: #F9F1ED; border-radius: 15px; border: 2px solid #AD8686;">
							<div class="custom-file mb-3">
								<input type="file" class="custom-file-input" id="upFile"
									name="upFile"> <label class="custom-file-label"
									for="customFile">그룹 이미지를 올려주세요</label>
							</div>
							<br /> <br /> <label for="srComment"><h4>한줄 소개</h4></label> <br />
							<textarea id="srComment" rows="3" class="col-lg-12"
								name="srComment" style="border-radius: 15px;"
								placeholder="그룹을 소개해주세요"></textarea>
						</div>
						
						<div class="col-sm pt-3 text-center">
							<button type="submit" class="btn btn-outline-primary">등록
							</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
