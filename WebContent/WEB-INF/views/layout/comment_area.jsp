<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="content_line">
    <h3>コメント</h3>
</div>
<c:forEach var="comment" items="${comments}">
    <table>
        <tbody>
            <tr>
                <c:choose>
                    <c:when test="${comment.user.profile_phto != null}">
                        <th rowspan="2" class="comment_img_block"><img src="${pageContext.request.contextPath}/user_photo/${comment.user.profile_phto}" id="comment_img"></th>
                    </c:when>
                    <c:otherwise>
                        <th rowspan="2" class="comment_img_block"><img src="${pageContext.request.contextPath}/user_initial_icon/initial_icon.png" id="comment_img"></th>
                    </c:otherwise>
                </c:choose>
                <td>
                    名前：<a href="<c:url value='/user/show?id=${comment.user.id}' />"><c:out value="${comment.user.name}"/></a>
                </td>
            </tr>
            <tr>
                <td>
                    <pre><c:out value="${comment.contents}"/><br/></pre>
                    <p id="comment_time">
                        作成日時：<fmt:formatDate value="${recruitment.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                        　　更新日時：<fmt:formatDate value="${recruitment.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />　　
                    </p>
                    <c:if test="${sessionScope.login_user.id == comment.user.id}">
                        <div id="comment_button_right">
                            <input type="button" value="編集" onclick="location.href='<c:url value='/comment/edit?id=${comment.id}'/>'"/>
                            　<input type="button" value="削除" onclick="confirmCommentDestroy();"/>
                            <form name="comment_destroy" method="POST" action="<c:url value='/comment/destroy' />">
                                <input type="hidden" name="_token" value="${_token}" />
                                <input type="hidden" name="comment_id" value="${comment.id}" />
                            </form>
                        </div>
                    </c:if>
                </td>
            </tr>
        </tbody>
    </table>
</c:forEach>
<c:choose>
    <c:when test="${sessionScope.login_user != null}">
        <form method="POST" action="<c:url value='/comment/create'/>">
            <div id="centering_comment">
                <div id="comment_block">
                    <label id="comment_label" for="comments">コメント内容</label>
                    <br/>
                    <textarea name="comments" class="comment_textarea" maxlength='255' required></textarea>
                    <br/>
                    <div id="form_button">
                        <input type="hidden" name="recruitment_id" value="${recruitment.id}" />
                        <input type="hidden" name="_token" value="${_token}" />
                        <button class="comment_button">送信</button>
                    </div>
                </div>
            </div>
        </form>
    </c:when>
    <c:otherwise>
        <div id="caution_message">
            <p>コメント機能はログイン後に使うことができます。</p>
        </div>
    </c:otherwise>
</c:choose>
<script type="text/javascript" src="<c:url value='/js/destroy.js' />"></script>
