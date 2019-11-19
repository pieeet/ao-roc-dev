<%@ page import="formtest.KeyValue" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: piet
  Date: 14/11/2019
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>formcheck</title>
</head>

<%
    ArrayList<KeyValue> kvlist = (ArrayList<KeyValue>) request.getAttribute("kvlist");
%>


<body>

<table>
    <tr>
        <th>parameter naam</th>
        <th>parameter waarde</th>
    </tr>

    <%
        for (KeyValue kv : kvlist) { %>
    <tr>
        <td><%= kv.getKey() %>
        </td>
        <td><%= kv.getValue() %>
        </td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>
