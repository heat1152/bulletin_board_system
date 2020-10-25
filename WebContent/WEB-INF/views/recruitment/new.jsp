<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <div id="content_line">
            <h2>募集新規作成</h2>
        </div>
        <form method="POST" action="<c:url value='/recruitment/create' />">
            <c:import url="../layout/recruitment_form.jsp"/>
            <div id="form_button">
                <button type="submit">作成</button>
            </div>
        </form>
    </c:param>
</c:import>