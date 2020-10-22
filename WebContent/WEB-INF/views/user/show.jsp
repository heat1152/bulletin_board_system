<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <h2>ユーザー詳細</h2>
        <table>
            <tbody>
                <tr>
                    <td>名前：<c:out value="${user.name}"/></td>
                </tr>
                <tr>
                    <td><c:out value="${user.profile}"/></td>
                </tr>
            </tbody>
        </table>
    </c:param>
</c:import>