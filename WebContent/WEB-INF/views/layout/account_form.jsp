<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label for="name">名前</label><br />
<input type="text" name="name" value="${name}" />
<br /><br />
<label for="password">パスワード</label><br />
<input type="password" name="password" />
<br /><br />
<input type="hidden" name="_token" value="${_token}" />