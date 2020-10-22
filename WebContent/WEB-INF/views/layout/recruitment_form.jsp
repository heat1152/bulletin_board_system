<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<label for="recruitment_contents">募集内容</label><br />
<textarea name="recruitment_contents" rows="10" cols="50" maxlength='255'>${recruitment.contents}</textarea>
<br /><br />
<input type="hidden" name="_token" value="${_token}" />