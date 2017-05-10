package cdc.model;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author tatuapu
 */
public class Publicacao {
    private String titulo;
    private String cidade;
    private int anoPublicacao;
    private int isbn;
    private int idPublicacao;
    private List<Autor> listAutor;
    
    public Publicacao(String titulo, String cidade, int anoPublicacao, int isbn, int idPublicacao){
        this.titulo = titulo;
        this.cidade = cidade;
        this.anoPublicacao = anoPublicacao;
        this.isbn = isbn;
        this.idPublicacao = idPublicacao;
        this.listAutor = new ArrayList<Autor>();
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the anoPublicacao
     */
    public int getAnoPublicacao() {
        return anoPublicacao;
    }

    /**
     * @param anoPublicacao the anoPublicacao to set
     */
    public void setAnoPublicacao(int anoPublicacao) {
        this.anoPublicacao = anoPublicacao;
    }

    /**
     * @return the isbn
     */
    public int getIsbn() {
        return isbn;
    }

    /**
     * @param isbn the isbn to set
     */
    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    /**
     * @return the idPublicacao
     */
    public int getIdPublicacao() {
        return idPublicacao;
    }

    /**
     * @param idPublicacao the idPublicacao to set
     */
    public void setIdPublicacao(int idPublicacao) {
        this.idPublicacao = idPublicacao;
    }

    /**
     * @return the listAutor
     */
    public List<Autor> getListAutor() {
        return listAutor;
    }

    /**
     * @param listAutor the listAutor to set
     */
    public void setListAutor(List<Autor> listAutor) {
        this.listAutor = listAutor;
    }
}
