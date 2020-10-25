<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${recruitment != null}">
                <div id="content_line">
                    <h2>募集詳細ページ</h2>
                </div>
                <table>
                    <tbody>
                        <tr><td>名前：<a href="<c:url value='/user/show?id=${recruitment.user.id}' />"><c:out value="${recruitment.user.name}"/></a></td></tr>
                        <tr class="contents_tr"><td><c:out value="${recruitment.contents}"/></td></tr>
                        <tr><td>作成日時：<fmt:formatDate value="${recruitment.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr>
                        <tr><td>更新日時：<fmt:formatDate value="${recruitment.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr>
                        <c:if test="${sessionScope.login_user.id == recruitment.user.id}">
                            <tr>
                                <td>
                                    <input type="button" value="編集" onclick="location.href='<c:url value='/recruitment/edit?id=${recruitment.id}'/>'"/>
                                    　<input type="button" value="削除" onclick="confirmDestroy();"/>
                                    <form name="recruitment_destroy" method="POST" action="<c:url value='/recruitment/destroy' />">
                                        <input type="hidden" name="_token" value="${_token}" />
                                        <input type="hidden" name="recruitment_id" value="${recruitment.id}" />
                                    </form>
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
                <br/>
                <c:import url="../layout/comment_area.jsp"/>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
        <script type="text/javascript" src="<c:url value='/js/destroy.js' />"></script>
    </c:param>
</c:import>