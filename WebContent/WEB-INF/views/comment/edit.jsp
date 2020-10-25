<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${comment != null}">
                <div id="content_line">
                    <h2>コメント編集</h2>
                </div>
                <form method="POST" action="<c:url value='/comment/update' />">
                    <div id="centering_parent">
                        <div id="form_center">
                            <label for="comment_contents">コメント内容*</label><br />
                            <textarea name="comment_contents" class="contents_textarea" maxlength='255' required>${comment.contents}</textarea>
                            <br /><br />
                        </div>
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <div id="form_button">
                        <button type="submit">更新</button>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>