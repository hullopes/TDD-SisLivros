package cdc.model;

import cdc.util.ConnectionDAO;
import cdc.util.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PublicacaoDAO implements DAO {
    private Connection conn;

    public PublicacaoDAO() throws Exception{
        try{
            this.conn = ConnectionDAO.getConnection();
        }catch(Exception e){
            throw new Exception("Erro: \n"+e.getMessage());
        }
    }
    @Override
    public void atualizar(Object ob) throws Exception {
        Publicacao pub = (Publicacao) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        if(pub == null){
            throw new Exception("O valor passado não pode ser nulo");
        }
        try{
            String SQL = "UPDATE publicacao SET titulo=?, cidade=?, anoPublicacao=?, isbn=? WHERE idPublicacao=?";
            conn = this.conn;
            ps = conn.prepareStatement(SQL);
            ps.setString(1, pub.getTitulo());
            ps.setString(2, pub.getCidade());
            ps.setInt(3, pub.getAnoPublicacao());
            ps.setInt(4, pub.getIsbn());
            ps.setInt(5, pub.getIdPublicacao());
            ps.executeUpdate();
        }catch(SQLException sqle){
            throw new Exception("Erro ao atualizar dados: " +sqle);
        }finally{
            ConnectionDAO.closeConnection(conn,ps);
        }
    }

    @Override
    public void excluir(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List listaTodos() throws Exception {
       PreparedStatement ps = null;
       Connection conn = null;
       ResultSet rs = null;
       List<Publicacao> publicacoes = new ArrayList<Publicacao>();
       try{
           conn = this.conn;
           ps = conn.prepareStatement("select * from publicacao");
           rs = ps.executeQuery();
           while(rs.next()){
               int idPublicacao = rs.getInt(1);
               String titulo = rs.getString(2);
               String cidade = rs.getString(3);
               int anoPublicacao = rs.getInt(4);
               int isbn = rs.getInt(5);
               Publicacao pub = new Publicacao(titulo, cidade, anoPublicacao, isbn, idPublicacao);
               ps = conn.prepareStatement("select * from autor_has_publicacao inner "
                       + "join autor on autor.idAutor = autor_has_publicacao.autor_idAutor where publicacao_idPublicacao = ?");
               ps.setInt(1, idPublicacao);
               ResultSet rs2 = null;
               rs2 = ps.executeQuery();
               List<Autor> autores = new ArrayList<Autor>();
               while(rs2.next()){
                   int idAutor = rs2.getInt(3);
                   String nomeAutor = rs2.getString(4);
                   String nmCitacao = rs2.getString(5);
                   autores.add(new Autor(nomeAutor, nmCitacao, idAutor));
               }
               pub.setListAutor(autores);
               publicacoes.add(pub);
           }
       }catch(SQLException sqle){
           throw new Exception(sqle);
       }finally{
           ConnectionDAO.closeConnection(conn, ps, rs);
       }
       return publicacoes;
    }

    @Override
    public List procura(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void salvar(Object ob) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Integer getLastInsertedId() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
