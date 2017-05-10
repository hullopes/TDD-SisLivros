package cdc.model;

import cdc.util.ConnectionDAO;
import cdc.util.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import cdc.model.Autor;
import java.sql.Statement;

/**
 *
 * @author tatuapu
 */
public class AutorDAO  implements DAO{
    private Connection conn;
    private Integer lastInsertedId = null;
    
    public AutorDAO() throws Exception{
        try{
            this.conn = ConnectionDAO.getConnection();
        }catch(Exception e){
            throw new Exception("Erro: \n"+e.getMessage());                    
        }
    }
    @Override
    public void salvar(Object ob) throws Exception{
        Autor aut;
        aut =  (Autor) ob;    
        int insertedId = 0;
        PreparedStatement ps = null;
        Connection conn = null;
        if (aut == null){
            throw new Exception("O valor passado não pode ser nulo");
        }
        
        try{
            String SQL = "INSERT INTO autor (nomeAutor, nmCitacao) VALUES (?,?)";
            conn = this.conn;
            ps = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);//corrigindo o problema de You need to specify Statement.RETURN_GENERATED_KEYS to Statement.executeUpdate()
            ps.setString(1, aut.getNomeAutor());
            ps.setString(2, aut.getNmCitacao());
            ps.executeUpdate();
            //recuperando o id inserido
            ResultSet rss = ps.getGeneratedKeys();
            if (rss.next()) {
                insertedId = rss.getInt(1);
            }
        }catch (SQLException sqle){
            throw new Exception("Erro ao inserir dados do autor: \n"+sqle);
        }finally{
            ConnectionDAO.closeConnection(conn,ps);
            this.lastInsertedId = insertedId;
        }
    }
    
    @Override
    public void excluir(Object ob) throws Exception{
        Autor aut = (Autor) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        if(aut==null){
            throw new Exception("O valor passado não pode ser nulo");
        }
        try{
            conn = ConnectionDAO.getConnection();
            ps = conn.prepareStatement("DELETE FROM autor WHERE idAutor=?");
            ps.setInt(1, aut.getIdAutor());
            ps.executeUpdate();
        }catch(SQLException sqle){
            throw new Exception("Erro ao excluir dados: "+sqle);
        }finally{
            ConnectionDAO.closeConnection(conn, ps);
        }
    }
    @Override
    public void atualizar(Object ob) throws Exception{
        Autor aut = (Autor) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        if(aut==null){
            throw new Exception("O valor passado não pode ser nulo");
        }
        try{
            conn = this.conn;
            ps = conn.prepareStatement("UPDATE autor SET nomeAutor=?, nmCitacao=? WHERE idAutor=?");
            ps.setString(1, aut.getNomeAutor());
            ps.setString(2, aut.getNmCitacao());
            ps.setInt(3, aut.getIdAutor());
            ps.executeUpdate();
        }catch(SQLException sqle){
            throw new Exception("Erro ao atualizar dados: "+sqle);
        }finally{
            ConnectionDAO.closeConnection(conn, ps);
        }
    }
    @Override
    public List listaTodos() throws Exception{
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try{
            conn = ConnectionDAO.getConnection();//corrigindo o problema do no operations allowed after connection closed
            ps = conn.prepareStatement("SELECT * FROM autor");
            rs = ps.executeQuery();
            List<Autor> list = new ArrayList<Autor>();
            while(rs.next()){
                   Integer idAutor = rs.getInt(1);
                   String nomeAutor = rs.getString(2);
                   String nmCitacao = rs.getString(3);
                   list.add(new Autor(nomeAutor,nmCitacao,idAutor));
            }
            return list;
        }catch(SQLException sqle){
            throw new Exception(sqle);
        }finally{
            ConnectionDAO.closeConnection(conn, ps, rs);
        }
    }
    @Override
    public List procura(Object ob) throws Exception{
        Autor aut = (Autor) ob;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        if(aut == null)
            throw new Exception("O valor passado não pode ser nulo");
        try{
            conn = this.conn;
            String SQL = "SELECT * FROM autor ";
            String where = "";
            boolean checa = false;
            if(aut.getIdAutor()!=0 || aut.getNomeAutor()!=null || aut.getNmCitacao()!=null){
                where = "where ";
                if(aut.getIdAutor()!=0){
                    where+= "idAutor=? ";
                    checa = true;
                }
                if(aut.getNomeAutor()!=null){
                    if(checa) where+="and";
                    where += " nomeAutor=? ";
                    checa = true;
                }
                if(aut.getNmCitacao()!=null){
                    if(checa) where+="and";
                    where += " nmCitacao=? ";
                }
            }
            ps = conn.prepareStatement(SQL+where);
            int contaCampos=1;
            if(aut.getIdAutor()!=0 || aut.getNomeAutor()!=null || aut.getNmCitacao()!=null){
                if (aut.getIdAutor()!=0){
                    ps.setInt(contaCampos,aut.getIdAutor());
                    contaCampos++;
                }
                if (aut.getNomeAutor()!=null){
                    ps.setString(contaCampos,aut.getNomeAutor());
                    contaCampos++;
                }
                if (aut.getNmCitacao()!=null)
                    ps.setString(contaCampos,aut.getNmCitacao());
            }
            rs = ps.executeQuery();
            List<Autor> list = new ArrayList<Autor>();
            while(rs.next()){
                Integer idAutor = rs.getInt(1);
                String nomeAutor = rs.getString(2);
                String nmCitacao = rs.getString(3);
                list.add(new Autor(nomeAutor, nmCitacao, idAutor));
            }
            return list;
        }catch(SQLException sqle){
            throw new Exception(sqle);
        }finally{
            ConnectionDAO.closeConnection(conn,ps,rs);
        }
    }

    @Override
    public Integer getLastInsertedId() {
        return this.lastInsertedId;
    }
}
