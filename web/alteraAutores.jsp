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
        
        <div style="padding: 10px; margin:10px;">
            <p>Alteração dos dados do autor: </p>
            <form action="autores" method="post">
                <input type="hidden" name="cmd" value="saveUpdate" />
                <label>idAutor</label><br />
                <input type="text" name="idAutor" value="${autorList.get(0).idAutor}" readonly="readonly" />
                <br />
                <label>Nome do Autor</label><br />
                <input type="text" name="nomeAutor" value="${autorList.get(0).nomeAutor}" />
                <br />
                <label>Nome de Citação</label><br />
                <input type="text" name="nmCitacao" value="${autorList.get(0).nmCitacao}" />
                <br />
                <input type="submit" value="Salvar Alterações" />
            </form>    
        </div>
    </body>
</html>
