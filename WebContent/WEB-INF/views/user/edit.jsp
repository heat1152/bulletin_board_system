<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${user != null}">
                <h2>マイページ編集</h2>
                <form method="POST" action="<c:url value='/user/update'/>">
                    <div id="centering_parent">
                        <div id="form_center">
                            <label for="name">名前</label><br />
                            <input type="text" name="name" value="${user.name}" class="account_textarea" maxlength='20'/>
                            <br /><br />
                            <label for="profile">自己紹介文</label><br />
                            <textarea name="profile" class="contents_textarea" maxlength='255'>${user.profile}</textarea>
                            <br /><br />
                        </div>
                    </div>
                    <input type="hidden" name="_token" value="${_token}" />
                    <div id="form_button">
                        <button type="submit">更新</button>
                    </div>
                </form>
            </c:when>
        </c:choose>
    </c:param>
</c:import>