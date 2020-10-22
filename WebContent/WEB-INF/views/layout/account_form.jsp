<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label for="name">名前</label><br />
<input type="text" name="name" class="account_form" value="${name}" maxlength='20' />
<br /><br /><br /><br />
<label for="password">パスワード</label>※半角英数<br />
<input type="password" name="password" class="account_form" pattern="^[0-9A-Za-z]+$" maxlength='64'/>
<br /><br />
<input type="hidden" name="_token" value="${_token}" />