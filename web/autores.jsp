<%-- 
    Document   : autores
    Created on : 16/08/2016, 09:00:11
    Author     : tatuapu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisLivros - Sistema de gerenciamento de livros - Listagem de Autores -  0.1.0 Beta</title> 
        <style>
            .autor{width:100%; clear:both;}
            .idAutor{width:60px; float:left;}
            .nmAutor{width:200px; float:left;}
        </style>
    </head>
    <body>
        <h1>Seja Bem-Vindo ao SisLivros 0.1.0- Beta - Listagem de Autores</h1>
        <div style="padding:10px; background-color: #cccccc; text-align: center;">
            <span style="padding:5px;">
                <a href="/SisLivros" title="Clique para voltar">Home</a>
            </span>
            <span style="padding:5px;">
                <a href="publicacoes.jsp" title="Clique para listar as publicacoes">Listagem de Publicações</a>
            </span>
        </div>
        <a href="autores?cmd=add">Cadastrar novo Autor</a>
        <div style="padding: 10px; margin:10px;">
            <table>
                <tr>
                    <th>ID - Atualizar</th>
                    <th>Nome</th>
                    <th>Citação</th>
                    <th>Excluir Autor</th>
                </tr>
                <c:forEach var="lista" items="${ requestScope.autorList }">
                    <tr>
                        <td><a href="autores?cmd=update&id=${lista.idAutor}">${lista.idAutor}</a></td>
                        <td>${lista.nomeAutor}</td>
                        <td>${lista.nmCitacao}</td>
                        <td><a href="autores?cmd=del&id=${lista.idAutor}">Excluir Autor</a></td>
                    </tr>
                </c:forEach>
            </table> 
        </div>
        <div style="padding:10px; background-color: #cccccc; text-align: center;">
            <%
                String email = (String) request.getAttribute("adminEmail");
                out.println(email);
                out.println("----------");
                
                 out.println(getServletContext().getInitParameter("emailGeral"));

             %>   
        </div>
    </body>
</html>
