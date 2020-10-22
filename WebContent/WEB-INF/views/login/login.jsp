<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                名前かパスワードが間違っています。
            </div>
        </c:if>
        <h2>ログイン</h2>
        <form method="POST" action="<c:url value='/login' />">
            <c:import url="../layout/account_form.jsp"/>
            <button type="submit">ログイン</button>
        </form>
    </c:param>
</c:import>