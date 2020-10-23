<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${sessionScope.login_user.id == user.id}">
                <h2>マイページ</h2>
            </c:when>
            <c:otherwise>
                <h2>ユーザー詳細</h2>
            </c:otherwise>
        </c:choose>
        <table>
            <tbody>
                <tr>
                    <td>名前：<c:out value="${user.name}"/></td>
                </tr>
                <tr class="contents_tr">
                    <td><c:out value="${user.profile}"/></td>
                </tr>
            </tbody>
        </table>
        <c:if test="${sessionScope.login_user.id == user.id}">
            <div id="form_button">
                <button onclick="location.href='<c:url value='/user/edit?id=${user.id}' />'">編集する</button>
            </div>
        </c:if>
    </c:param>
</c:import>