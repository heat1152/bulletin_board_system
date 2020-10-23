<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${recruitment != null}">
                <h2>募集編集</h2>
                <form method="POST" action="<c:url value='/recruitment/update' />">
                    <c:import url="../layout/recruitment_form.jsp"/>
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