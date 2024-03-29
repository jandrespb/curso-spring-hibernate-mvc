<!-- Add support for JSTL Core tags-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!--%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %-->
<!DOCTYPE html>
<html>
<head>
<link type="text/css"
rel="stylesheet"
href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>
        
        <div id="container">
            <div id="content">
            
              <!--put new button: Add Customer-->
               <input type="button" value="Add Customer" 
               onclick="window.location.href='showFormForAdd'; return false" 
               class="add-button"> 
            
                <!-- add our html table here-->
                <table>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Action</th>

                        <!--loop over and print our customer-->
                        <c:forEach var="tempCustomer" items="${customers}">
                        
                        <!-- construct an "update link with customer id" -->
                        <c:url var="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>
                        
                        <!-- construct an "delete link with customer id" -->
                        <c:url var="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                        </c:url>
                        
                            <tr>
                                <td>${tempCustomer.firstName}</td>
                                <td>${tempCustomer.lastName}</td>
                                <td>${tempCustomer.email}</td>
                                
                                <td>
                                <!-- display the update link -->
                                <a href="${updateLink}">Update</a>
                                |
                                <!-- display the delete link -->
                                <a href="${deleteLink}" onclick = "notify()"> Delete</a>                   
                                </td>
                            </tr>
                        </c:forEach>
                    </tr>
                </table>
            </div>
        </div>
    </div>
 <script type="text/javascript">
 
 function notify(){
	 
	  if(!confirm('Are you sure ?')){
	       event.preventDefault();
	        return false;
	    }
 }
 </script>
</body>
</html>