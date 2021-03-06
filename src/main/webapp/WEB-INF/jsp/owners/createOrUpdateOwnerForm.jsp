<%@page import="java.io.File"%>
<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<html lang="en">

    <jsp:include page="../fragments/headTag.jsp"/>

    <body>
        <div class="container">
            <jsp:include page="../fragments/bodyHeader.jsp"/>
            <c:choose>
                <c:when test="${owner['new']}"><c:set var="method" value="post"/></c:when>
                <c:otherwise><c:set var="method" value="post"/></c:otherwise>
            </c:choose>

            <c:set var="ownerImagesList" value="${owner['ownerImage']}" />

            <h2>
                <c:if test="${owner['new']}">New </c:if> Owner
                </h2>


            <spring:url value="/resources/ownerImages/${ownerImagesList[0].imageName}" var="ownerImageUrl"/>
            <img src="${ownerImageUrl}" style="width: 60px; height: 60px;"/>

            <form:form modelAttribute="owner" method="${method}" 
                       class="form-horizontal" id="add-owner-form"
                       enctype="multipart/form-data">

                <petclinic:inputField label="First Name" name="firstName"/>
                <petclinic:inputField label="Last Name" name="lastName"/>
                <petclinic:inputField label="Address" name="address"/>
                <petclinic:inputField label="City" name="city"/>
                <petclinic:inputField label="Telephone" name="telephone"/>
                <input type="file" name="image" />

                <form:errors path="image" cssClass="error" />

                <div class="form-actions">
                    <c:choose>
                        <c:when test="${owner['new']}">
                            <button type="submit">Add Owner</button>
                        </c:when>
                        <c:otherwise>
                            <button type="submit">Update Owner</button>
                        </c:otherwise>
                    </c:choose>
                </div>

            </form:form>
        </div>
        <jsp:include page="../fragments/footer.jsp"/>
    </body>

</html>
