<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>募集投稿掲示板</h2>
            <c:forEach var="user" items="${users}">
                <td><c:out value="${user.id}"/></td>
                <td><a href="<c:url value='/user/show?id=${user.id}' />"><c:out value="${user.name}"/></a></td>
                <td><c:out value="${user.profile}"/></td>
            </c:forEach>
    </c:param>
</c:import>