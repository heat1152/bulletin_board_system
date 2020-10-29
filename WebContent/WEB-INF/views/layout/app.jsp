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
                <h1><a href="<c:url value='/' />">募集投稿掲示板</a></h1>
                <div id="menu">
                    <c:if test="${sessionScope.login_user == null}">
                        <a href="<c:url value='/recruitment/index' />">募集一覧</a>
                        <a href="<c:url value='/login' />">ログイン</a>
                        <a href="<c:url value='/account/new' />">新規登録</a>
                    </c:if>
                     <c:if test="${sessionScope.login_user != null}">
                        <a href="<c:url value='/recruitment/index' />">募集一覧</a>
                        <a href="<c:url value='/' />">自分の投稿</a>
                        <a href="<c:url value='/user/show?id=${sessionScope.login_user.id}' />">マイページ</a>
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </c:if>
                </div>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <c:if test="${sessionScope.login_user != null}">
                <nav>
                    <ul>
                        <li><a href="<c:url value='/recruitment/index' />">募集一覧</a></li>
                        <li><a href="<c:url value='/' />">自分の投稿</a></li>
                        <li><a href="<c:url value='/user/show?id=${sessionScope.login_user.id}' />">マイページ</a></li>
                        <li><a href="<c:url value='/logout' />">ログアウト</a></li>
                    </ul>
                </nav>
            </c:if>
            <div id="footer">
                <p>お問合せ</p>  <p>利用規約</p>
            </div>
        </div>
    </body>
</html>