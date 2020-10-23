<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>新規登録</h2>
        <form method="POST" action="<c:url value='/account/create' />">
            <c:import url="../layout/account_form.jsp"/>
            <div id="form_button">
                <button type="submit" onclick="return accountCheck()">新規登録</button>
            </div>
        </form>
        <script type="text/javascript" src="<c:url value='/js/validator.js' />"></script>
    </c:param>
</c:import>