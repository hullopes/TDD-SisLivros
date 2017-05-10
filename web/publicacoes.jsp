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
        <title>SisLivros - Sistema de gerenciamento de livros - Listagem de Publicações -  0.1.0 Beta</title> 
        <style>
            .autor{width:100%; clear:both;}
            .idAutor{width:60px; float:left;}
            .nmAutor{width:200px; float:left;}
        </style>
    </head>
    <body>
        <h1>Seja Bem-Vindo ao SisLivros 0.1.0- Beta - Listagem de Publicacoes</h1>
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
                    <th>Título</th>
                    <th>Cidade</th>
                    <th>Ano</th>
                    <th>ISBN</th>
                    <th>Excluir</th>
                </tr>
                <c:forEach var="lista" items="${ requestScope.publicacaoList }">
                    <tr>
                        <td><a href="publicacoes?cmd=update&id=${lista.idPublicacao}">${lista.idPublicacao}</a></td>
                        <td>${lista.titulo}</td>                     
                        <td>${lista.cidade}</td>
                        <td>${lista.anoPublicacao}</td>
                        <td>${lista.isbn}</td>
                        <td><a href="publicacoes?cmd=del&id=${lista.idPublicacao}">Excluir</a></td>
                    </tr>
                    <tr>
                        <td>Autor(es)</td>
                        <td colspan="5">
                            <c:forEach var="listaAutores" items="${lista.listAutor}">
                                ${listaAutores.nomeAutor}<br />
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>
            </table> 
        </div>
    </body>
</html>
