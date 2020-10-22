<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>募集一覧</h2>
        <table id="recruitment_list">
            <tbody>
                <c:forEach var="recruitment" items="${recruitments}">
                    <tr><td>名前：<a href="<c:url value='/user/show?id=${recruitment.user.id}' />"><c:out value="${recruitment.user.name}"/></a></td></tr>
                    <tr><td><c:out value="${recruitment.contents}"/></td></tr>
                    <tr><td><a href="<c:url value='/recruitment/show?id=${recruitment.id}'/>">詳細を見る</a></td></tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="pagination">
            （全 ${recruitments_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((recruitments_count - 1) / 10) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/recruitment/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </c:param>
</c:import>