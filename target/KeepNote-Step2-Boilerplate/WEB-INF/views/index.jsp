 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" isELIgnored="false"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Keep-Board</title>
</head>

<body>

<!-- Create a form which will have text boxes for Note title, content and status along with a Add
		 button. Handle errors like empty fields -->
 <h1>Add New Employee  track</h1>
             <form:form method="post" action="add">
              <table >
               <tr>
                <td>Note Title : </td>
                <td><input type="text" name="noteTitle"/></td>
               </tr>
               <tr>
                <td>Content :</td>
               <td><input type="text" name="noteContent"/></td>
               </tr>
               <tr>
               	  Status:<br>
               	  <select id="noteStatus" name= "noteStatus">
               		  <option value="active">Active</option>
               		  <option value="inactive">Inactive</option>
               	  </select>
               	  <br>
               	  </tr>
                <td> </td>
                <td><input type="submit" value="Add" /></td>
               </tr>
              </table>
             </form:form>



	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->
<c:if test="${not empty errorMessage}">
	   <p style="color:red">Error</p>: ${errorMessage}
	</c:if>

 <c:if test = "${list.size() > 0}">
    	<table id="table"  border="2">
            <tbody>
                <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Content</th>
    			<th>Status</th>
    			<th>Create At</th>
                </tr>
                 <c:forEach items="${list}" var="noteVar">
    	            <tr>
    	       			<td>${noteVar.noteId}</td>
    	                <td>${noteVar.noteTitle}</td>
    	                <td>${noteVar.noteContent}</td>
    	                <td>${noteVar.noteStatus}</td>
    	                <td>${noteVar.createdAt}
    	                <a href="/delete?noteId=${noteVar.noteId}">
    	                <button>delete</button></a>
    	                <a href="/updateNote?noteId=${noteVar.noteId}">
                            	                <button>edit</button></a>
    	                </td>
    	            </tr>
          		</c:forEach>
            </tbody>
        </table>
        </c:if>
</body>

</html>




