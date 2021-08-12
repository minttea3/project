<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp Create</title>
<style>
.center{
margin: 5px 25px; 
padding: 20px;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
	<form class="center" method="post">
        <h2>Create Page</h2>
        <!-- <div class="form-group">
              <label>사원 번호</label>
            <input type="text" class="form-control" name="empno" placeholder="사원 번호를 작성해주세요.">
        </div> -->
        <div class="form-group">
            <label>사원 이름</label>
            <input type="text" class="form-control" name="ename" placeholder="NAME 적어주세요.">
        </div>
        <div class="form-group">
            <label>사원 직업</label>
            <input class="form-control" name="job" placeholder="직업 적어주세요.">
        </div>
        <div class="form-group">
            <label>직업 번호</label>
            <input class="form-control" name="mgr" placeholder="번호 적어주세요.">
        </div>
         <!-- <div class="form-group">
            <label>입사 일자</label>
            <input class="form-control" name="hiredate" type="date" placeholder="입사 일자 적어주세요.">
        </div>  -->
        <div class="form-group">
            <label>급여 </label>
            <input class="form-control" name="sal" placeholder="급여 적어주세요.">
        </div>
        <div class="form-group">
            <label>커미션</label>
            <input class="form-control" name="comm" placeholder="커미션 적어주세요.">
        </div>
        <div class="form-group">
            <label>부서번호</label>
            <input class="form-control" name="deptno" placeholder="부서번호 적어주세요.">
        </div>
       
    <button type="submit" class="btn btn-outline-info">등록</button>
    <button type="button" class="btn btn-outline-info"><a href="../">돌아가기</a></button>
    </form>
</body>

</body>
</html>