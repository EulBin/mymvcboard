<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./commons/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 목록 - <small>자유게시판</small></h3>
            <!-- 검색 -->
            <div class="row">
                <form action="">
                    <div class="input-group ms-auto" style="width: 400px;">
                        <select name="" class="form-control">
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">작성자</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Search" style="width: 200px;">
                        <button class="btn btn-success" type="submit">
                            <i class="bi-search" style="font-size: 1rem; color: white;"></i>
                        </button>
                    </div>
                </form>
            </div>
            <!-- 게시판 리스트 -->
            <div class="row mt-3 mx-1">
                <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr class="text-center">
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>첨부</th>
                    </tr>
                </thead>
                <tbody>

                    <c:choose>
<c:when test="${empty boardLists }">
		<!-- 리스트 컬렉션에 저장된 게시물이 없을때 출력부분 -->
        <tr>
            <td colspan="6" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
</c:when>
	<c:otherwise>
		<!-- 출력할 게시물이 있는경우 실행. 리스트 컬렉션에 저장된 게시물의
		갯수만큼 반복하여 목록을 출력함. -->
		<c:forEach items="${boardLists }" var="row" varStatus="loop">
<!-- 출력할 게시물이 있을때 -->           
        <tr align="center">
        <!-- 
        가상번호 계산하기
        => 게시물갯수 - (((페이지번호-1) * 페이지당 게시물수 ) + 해당루프의 index)
        참고로 varStatus속성의 index는 0 부터 시작한다.
        	
        	전체게시물의 갯수가 5개일때
        	1페이지의 첫번째 게시물 번호 : 5 - (((1-1) * 2) + 0) =5
        	2페이지의 첫번째 게시물 번호 : 5 - (((2-1) * 2) + 0) =3
        -->
        	<td>
        		${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index) }
       		</td>
            <td align="left">
           		<!-- 제목. 클릭시 상세보기 페이지로 이동함. -->
               <a href="../mvcboard/view.do?idx=${row.idx }">
               ${row.title }</a>
            </td> 
            <td>${row.name }</td>
            <td>${row.visitcount }</td>
            <td>${row.postdate }</td>
            <td>
            <!-- 첨부파일이 있을때만 다운로드 링크를 출력함. -->
                <c:if test="${not empty row.ofile }">
                	<a href="../mvcboard/download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">
                	[Down]</a>
                </c:if>
            </td>
        </tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
    </table>
   	<!-- 하단 메뉴(바로가기, 글쓰기) -->
   	<div class="row mt-3">
                <div class="col">
                    <ul class="pagination justify-content-center">
    <table border="1" width="90%">
        <tr align="center">
            <td>
               <li class="page-item active"><a class="page-link" href="">${map.pagingImg }</a></li>
            </td>
        </tr>
    </table>
             
            </div>
          </div>
            <!-- 각종버튼 -->
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button type="button" class="btn btn-primary" onclick="location.href='../mvcboard/write.do';">글쓰기</button>
                </div>
            </div>
            <!-- 페이지 번호 -->
            <div class="row mt-3">
                <div class="col">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">
                            <i class='bi bi-skip-backward-fill'></i>
                        </a></li>
                        <li class="page-item"><a class="page-link" href="#">
                            <i class='bi bi-skip-start-fill'></i>
                        </a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">
                            <i class='bi bi-skip-end-fill'></i>
                        </a></li>
                        <li class="page-item"><a class="page-link" href="#">
                            <i class='bi bi-skip-forward-fill'></i>
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>