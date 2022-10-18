<%-- 
    Author     : VICTOR
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Producto"%>
<%
    if(session.getAttribute("lista") == null){
        ArrayList<Producto> listaAux = new ArrayList<Producto>();
        session.setAttribute("lista", listaAux);       
    }
    
    ArrayList<Producto> lista = (ArrayList<Producto>)session.getAttribute("lista");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tareas Pendientes</h1>
        <form action="MainServlet" method="POST">
            <table border="0">
                <tr>
                    <th>Id</th>
                    <th><input type="text" name="id" value="0" size="" > </th>
                </tr>
                <tr>
                    <td>Tarea</td>
                    <td><input type="text" name="tarea" value="" size="" > </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Procesar"></td>
                </tr>
            </table>
        </form>
        
        <a href="MainServlet?op=vaciar">Vaciar lista pendientes</a>
        <h2>Lista de Tareas</h2>
        <table border="3">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Completado</th>
                <th></th>
            </tr>
            <tr>
            <%
            if(lista != null){
                for(Producto p: lista){
            %>
                <td><%= p.getId() %></td>
                <td><%= p.getTarea() %></td>
                <td><input type="checkbox" name="" value="ON"/></a> </td>
                <td><a href="MainServlet?op=eliminar&id=<%= p.getId() %>">Eliminar</a></td>
            </tr>
            <%
                }    
            }
            %>
        </table>
    </body>
</html>