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
                <div id="content_line">
                    <h2>マイページ</h2>
                </div>
            </c:when>
            <c:otherwise>
                <div id="content_line">
                    <h2>ユーザー詳細</h2>
                </div>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${user.profile_phto != null}">
                <div id="user_img">
                    <img src="${pageContext.request.contextPath}/user_photo/${user.profile_phto}" id="show_img">
                </div>
            </c:when>
            <c:otherwise>
                <div id="user_img">
                    <img src="${pageContext.request.contextPath}/user_initial_icon/initial_icon.png" id="show_img">
                </div>
            </c:otherwise>
        </c:choose>
        <table>
            <tbody>
                <tr>
                    <td>名前：<c:out value="${user.name}"/></td>
                </tr>
                <tr class="contents_tr">
                    <td><pre><c:out value="${user.profile}"/></pre></td>
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