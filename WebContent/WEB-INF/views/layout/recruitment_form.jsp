<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="centering_parent">
    <div id="form_center">
        <label for="recruitment_contents">募集内容</label><br />
        <textarea name="recruitment_contents" class="contents_textarea" maxlength='255'>${recruitment.contents}</textarea>
        <br /><br />
    </div>
</div>
<input type="hidden" name="_token" value="${_token}" />