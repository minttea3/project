<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 정보 조회</title>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "boardDelete"; // Controller로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url, // 전송 URL
				type : 'POST', // POST 방식
				traditional : true,
				data : {
					valueArr : valueArr
				// 보내고자 하는 data 변수 설정
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("boardList") //list 로 페이지 새로고침
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
</script>

</head>
<body>

	<article>
		<form name="empnoSearch" 
			action="${path}/board/empnoSearch">
			<legend>사원 정보 empno로 검색</legend>
			<table style="background-color:yellow;">
			
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno"></td>
					<td align="center"><input type="submit" value="사원 검색">
				</tr>
			</table>
		</form>
	</article>
	<article>
		<form name="search" action="${path}/board/empSearch" enctype="multipart/form-data">
			<legend>사원 정보 여러 조건으로  검색</legend>
			<table style="background-color:silver;">
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="empno" value=""></td>
					<th>사원이름</th>
					<td><input type="text" name="ename" value=""></td>
					
					<td align="center"><input type="submit" value="사원 검색">
				</tr>
			</table>
		</form>
	</article>
	<h1>사원 정보 조회 페이지</h1>
	<table border="1" cellspacing="0">
		<thead>
			<tr>
				<th scope="col"><input id="allCheck" type="checkbox"
					name="allCheck" /></th>
				<th scope="col">사원 번호</th>
				<th scope="col">사원 이름</th>
				<th scope="col">사원 직업</th>
				<th scope="col">직업 번호</th>
				<th scope="col">입사 일자</th>
				<th scope="col">급여</th>
				<th scope="col">커미션</th>
				<th scope="col">부서번호</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list2 }">
				<c:forEach items="${list}" var="list">
				<tr>
					<td class="text_ct"><input name="RowCheck" type="checkbox" 	value="${list.empno}" /></td>
					<td class="text_ct">${list.empno }&nbsp;</td>
					<td class="text_ct"><a
						href="${path}/board/boardDetail?empno=${list.empno}">${list.ename }&nbsp;</a></td>
					<td class="text_ct">${list.job }&nbsp;</td>
					<td class="text_ct">${list.mgr }&nbsp;</td>

					<td class="text_ct"><fmt:formatDate value="${list.hiredate}"
							pattern="yyyy/MM/dd" /></td>
					<td class="text_ct">${list.sal }&nbsp;</td>
					<td class="text_ct">${list.comm }&nbsp;</td>
					<td class="text_ct">${list.deptno }&nbsp;</td>

				</tr>
				</c:forEach>
			</c:if>
			
			<c:forEach items="${list2}" var="list2">
			
				<tr>
					<td class="text_ct"><input name="RowCheck" type="checkbox" 	value="${list2.empno}" /></td>
					<td class="text_ct">${list2.empno }&nbsp;</td>
					<td class="text_ct"><a href="${path}/board/boardDetail?empno=${list2.empno}">${list2.ename }&nbsp;</a></td>
					<td class="text_ct">${ list2.job }&nbsp;</td>
					<td class="text_ct">${ list2.mgr }&nbsp;</td>

					<td class="text_ct"><fmt:formatDate value = "${list2.hiredate}" pattern="yyyy/MM/dd" /></td>
					<td class="text_ct">${ list2.sal }&nbsp;</td>
					<td class="text_ct">${ list2.comm }&nbsp;</td>
					<td class="text_ct">${ list2.deptno }&nbsp;</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="<c:url value='/board/boardCreate'/>" role="button" class="btn btn-outline-info">글쓰기</a>
	<input type="button" value="선택삭제" class="btn btn-outline-intfo" onclick="deleteValue();">
</body>
</html>