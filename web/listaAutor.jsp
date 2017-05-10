<%-- 
    Document   : listaAutor
    Created on : 16/08/2016, 09:47:57
    Author     : tatuapu
--%>

<%@page import="java.util.Arrays"%>
<%@page import="cdc.base.Publicacao"%>
<%@page import="cdc.base.Autor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisLivros - Sistema de gerenciamento de livros - Listagem de Autores -  0.1.0 Beta</title> 
    </head>
    <body>
        <h1>Seja Bem-Vindo ao SisLivros 0.1.0- Beta - Listagem de Autores</h1>
        <div style="padding:10px; background-color: #cccccc; text-align: center;">
            <span style="padding:5px;">
                <a href="/SisLivros" title="Voltar à Home">Home</a>
            </span>
            <span style="padding:5px;">
                <a href="autores.jsp" title="Clique para listar os autores">Listagem de Autores</a>
            </span>
            <span style="padding:5px;">
                <a href="publicacoes.jsp" title="Clique para listar as publicacoes">Listagem de Publicações</a>
            </span>
        </div>
        <h3>Dados do Autor</h3>
        <div style="padding:10px; margin:10px;">
            <%
                ArrayList<Autor> autores = new ArrayList<Autor>();
                autores = Autor.getAutores();
                int id = Integer.parseInt(request.getParameter("id"));
                for(Autor autor:autores){
                    if(autor.getIdAutor()==id){
                        out.println("<p>");
                        out.println("<span>Detalhes do Autor <b>"+autor.getNomeAutor()+"</b></span>");
                        out.println("<p>Código: "+request.getParameter("id")+"</p>");
                        out.println("<p>Nome de citação "+autor.getNmCitacao()+"</p>");
                        out.println("</p>");
                    }
                }
             %>   
        </div>
        
        <h3>Livros deste Autor</h3>
        <div style="padding:10; background-color:#cccccc; text-align: center;">
            <%
                ArrayList<Publicacao> publicacoes = new ArrayList<Publicacao>();
                publicacoes = Publicacao.getPublicacoes();
                for (Publicacao publicacao : publicacoes){
                    Integer[] auts = publicacao.getAutores();
                    if (Arrays.asList(auts).contains(id)){
                        out.println("<p>"+publicacao.getNmPublicacao() + " - "+publicacao.getAno()+"</p>");
                    }
                }
             %>   
        </div>
    </body>
</html>
