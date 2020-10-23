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
                <c:choose>
                    <c:when test="${sessionScope.login_user.id != null}">
                        <h1><a href="<c:url value='/toppage/index' />">募集投稿掲示板</a></h1>
                    </c:when>
                    <c:otherwise>
                      <h1><a href="<c:url value='/noAccountTopPage/index' />">募集投稿掲示板</a></h1>
                    </c:otherwise>
                </c:choose>
                <div id="menu">
                    <c:if test="${sessionScope.login_user == null}">
                        <a href="<c:url value='/login' />">ログイン</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/account/new' />">新規登録</a>
                    </c:if>
                     <c:if test="${sessionScope.login_user != null}">
                        <a href="<c:url value='/recruitment/index' />">募集一覧</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/user/show?id=${sessionScope.login_user.id}' />">マイページ</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                </div>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                <p>お問合せ</p>  <p>利用規約</p>
            </div>
        </div>
    </body>
</html>