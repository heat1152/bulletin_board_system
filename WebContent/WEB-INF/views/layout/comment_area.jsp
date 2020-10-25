<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p>コメント</p>
<table>
    <tbody>
        <c:forEach var="comment" items="${comments}">
            <tr>
                <td>
                    <a href="<c:url value='/user/show?id=${comment.user.id}' />"><c:out value="${comment.user.name}"/></a>　さん：
                    <br/><c:out value="${comment.contents}"/>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
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

