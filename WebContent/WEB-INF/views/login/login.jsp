<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                名前かパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>ログイン</h2>
        <form method="POST" action="<c:url value='/login' />">
            <c:import url="../layout/account_form.jsp"/>
            <div id="form_button">
                <button type="submit" onclick="return accountCheck()">ログイン</button>
            </div>
        </form>
        <script type="text/javascript" src="<c:url value='/js/validator.js' />"></script>
    </c:param>
</c:import>