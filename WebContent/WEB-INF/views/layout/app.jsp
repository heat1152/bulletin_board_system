<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>募集投稿掲示板</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <h1>募集投稿掲示板</h1>
            </div>
            <c:if test="${sessionScope.login_user == null}">
                <a href="<c:url value='/login' />">ログイン</a>&nbsp;
                <a href="<c:url value='/account/new' />">新規登録</a>&nbsp;
            </c:if>
             <c:if test="${sessionScope.login_user != null}">
                <a href="<c:url value='/logout' />">ログアウト</a>&nbsp;
            </c:if>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                <p>お問合せ</p>  <p>利用規約</p>
            </div>
        </div>
    </body>
</html>