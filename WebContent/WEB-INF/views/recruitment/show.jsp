<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${recruitment != null}">
                <h2>募集詳細ページ</h2>
                <table>
                    <tbody>
                        <tr><td>名前：<a href="<c:url value='/user/show?id=${recruitment.user.id}' />"><c:out value="${recruitment.user.name}"/></a></td></tr>
                        <tr class="contents_tr"><td><c:out value="${recruitment.contents}"/></td></tr>
                        <tr><td>作成日時：<fmt:formatDate value="${recruitment.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr>
                        <tr><td>更新日時：<fmt:formatDate value="${recruitment.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr>
                    </tbody>
                </table>
                <c:if test="${sessionScope.login_user.id == recruitment.user.id}">
                    <div id="form_button">
                        <button onclick="location.href='<c:url value='/recruitment/edit?=${recruitment.id}' />'">編集する</button>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>