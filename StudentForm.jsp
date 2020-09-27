<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration Form</title>
</head>
<body>

		<h1 style="text-align:center;">Student Details</h1>
        <h2 style="text-align:center;">
        	<a href="new">Add New Student</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="list">List All Students</a>
        	
        </h2>
	
		 <div align="center">
		<c:if test="${student != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${student == null}">
			<form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${student != null}">
            			Edit Student Details
            		</c:if>
            		<c:if test="${student == null}">
            			Add New Student
            		</c:if>
            	</h2>
            </caption>   
            <c:if test="${student != null}">
        			<input type="hidden" name="id" value="<c:out value='${student.id}' />" />
        		</c:if>     
            
            <tr>
                <th>Name: </th>
                <td>
                	<input type="text" name="name" size="45"
                			value="<c:out value='${student.name}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Email: </th>
                <td>
                	<input type="text" name="email" size="45"
                			value="<c:out value='${student.email}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Password: </th>
                <td>
                	<input type="text" name="password" size="45"
                			value="<c:out value='${student.password}' />"
                	/>
                </td>
            </tr>
             <tr>
                <th>Phone: </th>
                <td>
                	<input type="text" name="phone" size="45"
                			value="<c:out value='${student.phone}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>
