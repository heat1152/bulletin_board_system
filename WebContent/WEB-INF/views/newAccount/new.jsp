<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>新規登録</h2>
        <form method="POST" action="<c:url value='/account/create' />">
            <label for="name">名前</label><br />
            <input type="text" name="name" value="${name}" />
            <br /><br />

            <label for="password">パスワード</label><br />
            <input type="password" name="password" />
            <br /><br />
            <button type="submit">新規登録</button>
        </form>
    </c:param>
</c:import>