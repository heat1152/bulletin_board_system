<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="centering_parent">
    <div id="form_center">
        <label for="name">名前*</label><br />
        <input type="text" name="name" class="account_textarea" value="${name}" maxlength='20' id="user_name"/>
        <br /><br /><br /><br />
        <label for="password">パスワード*</label><br />
        <input type="password" name="password" class="account_textarea" pattern="^[0-9A-Za-z]+$" maxlength='64' id="user_pass"/>
        <br /><br />
    </div>
</div>
<input type="hidden" name="_token" value="${_token}" />