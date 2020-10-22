<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h2>マイページ編集</h2>
                <form method="POST" action="<c:url value='/user/update'/>">
                   <label for="name">名前</label><br />
                   <input type="text" name="name" value="${user.name}" />
                    <br /><br />
                    <label for="profile">自己紹介文</label><br />
                    <textarea name="profile" rows="10" cols="50">${user.profile}</textarea>
                    <br /><br />
                    <input type="hidden" name="_token" value="${_token}" />
                    <button type="submit">更新</button>
                </form>
            </c:when>
        </c:choose>
    </c:param>
</c:import>