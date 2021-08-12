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
 <h2>Update page</h2>
    <form name="update" method="POST" action="${path}/board/boardUpdate?empno=${data.empno}">
        <div>사원번호 : ${data.empno}</div>
        <div>이름 : </div>
        <div><input name="ename" value="${data.ename}" type="text"/></div>
        <div>job : </div>
        <div><input name="job" value="${data.job}" type="text"/></div>
        <div>직업번호</div>
        <div><input name="mgr" value="${data.mgr}" type="text"/></div>
         <div>급여</div>
        <div><input name="sal" value="${data.sal}" type="text"/></div>
       <%--  <div>작성일자</div>
        <div><fmt:formatDate value="${data.date}" pattern="yyyy/MM/dd" /></div> --%>
        <div>커미션</div>
        <div><input name="comm" value="${data.comm}" type="text"/></div>
        
        <div>        
            <input type="submit" class="btn btn-outline-info" value="완료"/>
            <input type="reset" class="btn btn-outline-info" value="리셋"/>
        </div>
    </form>
</body>
</html>