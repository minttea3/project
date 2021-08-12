<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

</head>
<body>
 <h2>Detail page</h2>
    <table border="1">
        <th> 정보 </th>
        <th> 데이터 </th>
        <tr>
            <td>작성일자</td>
            <td><fmt:formatDate value="${data.hiredate}" pattern="yyyy-MM-dd" />
            </td>
        </tr>
        <tr>
            <td>사원번호</td><td>${data.empno}</td>
        </tr>
        <tr>
            <td>이름</td><td>${data.ename}</td>
        </tr>
        <tr>
            <td>직업번호</td><td>${data.mgr}</td>
        </tr>
        <tr><td>급여</td><td>${data.sal}</td></tr>
        <tr><td>커미션</td><td>${data.comm}</td></tr>
    </table>
    <a href="/board/boardUpdate?empno=${data.empno}" role="button" class="btn btn-outline-info">수정</a>
    <a href="/board/boardDelete?empno=${data.empno}" role="button" class="btn btn-outline-info">삭제</a>
</body>
</html>