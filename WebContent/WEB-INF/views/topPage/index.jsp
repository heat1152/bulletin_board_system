<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${sessionScope.login_user.id != null}">
                <div id="content_line">
                    <h2>自分の投稿一覧</h2>
                </div>
                <div id="form_button">
                    <button onclick="location.href='<c:url value='/recruitment/new' />'">募集新規作成</button>
                </div>
                <c:forEach var="recruitment" items="${recruitments}">
                    <table>
                        <tbody>
                            <tr>
                                <c:choose>
                                    <c:when test="${recruitment.user.profile_phto != null}">
                                        <th rowspan="3" class="img_block"><img src="${pageContext.request.contextPath}/user_photo/${recruitment.user.profile_phto}" id="recruitment_img"></th>
                                    </c:when>
                                    <c:otherwise>
                                        <th rowspan="3" class="img_block"><img src="${pageContext.request.contextPath}/user_initial_icon/initial_icon.png" id="recruitment_img"></th>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    名前：<a href="<c:url value='/user/show?id=${recruitment.user.id}' />"><c:out value="${recruitment.user.name}"/></a>
                                </td>
                            </tr>
                            <tr class="contents_tr"><td><pre><c:out value="${recruitment.contents}"/></pre></td></tr>
                            <tr>
                                <td>
                                    <div id="show_link">
                                        <a href="<c:url value='/recruitment/show?id=${recruitment.id}'/>">詳細を見る</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:forEach>
                <div id="pagination">
                    （全 ${recruitments_count} 件）<br />
                    <c:forEach var="i" begin="1" end="${((recruitments_count - 1) / 10) + 1}" step="1">
                        <c:choose>
                            <c:when test="${i == page}">
                                <c:out value="${i}" />&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div id="content_line">
                    <h2>募集投稿掲示板</h2>
                </div>
                <div id="caution_message">
                    <p>投稿機能、コメント機能はログイン後に使うことができます。</p>
                </div>
                <div id="top_page_button">
                    <button onclick="location.href='<c:url value='/login' />'">ログイン</button>
                    <button onclick="location.href='<c:url value='/account/new' />'">新規登録</button>
                </div>
                <div id="content_line">
                    <h3>最新投稿</h3>
                </div>
                <c:forEach var="new_recruitment" items="${new_recruitments}">
                    <table>
                        <tbody>
                            <tr>
                                <c:choose>
                                    <c:when test="${new_recruitment.user.profile_phto != null}">
                                        <th rowspan="3" class="img_block"><img src="${pageContext.request.contextPath}/user_photo/${new_recruitment.user.profile_phto}" id="recruitment_img"></th>
                                    </c:when>
                                    <c:otherwise>
                                        <th rowspan="3" class="img_block"><img src="${pageContext.request.contextPath}/user_initial_icon/initial_icon.png" id="recruitment_img"></th>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    名前：<a href="<c:url value='/user/show?id=${new_recruitment.user.id}' />"><c:out value="${new_recruitment.user.name}"/></a>
                                </td>
                            </tr>
                            <tr class="contents_tr"><td><pre><c:out value="${new_recruitment.contents}"/></pre></td></tr>
                            <tr>
                                <td>
                                    <div id="show_link">
                                        <a href="<c:url value='/recruitment/show?id=${new_recruitment.id}'/>">詳細を見る</a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </c:forEach>
                <div id="form_button">
                    <button onclick="location.href='<c:url value='/recruitment/index' />'">全ての募集を見る</button>
                </div>
            </c:otherwise>
        </c:choose>
    </c:param>
</c:import>