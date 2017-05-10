package cdc.model;
/**
 *
 * @author tatuapu
 */
public class Autor {

    /**
     * @return the idAutor
     */
    public int getIdAutor() {
        return idAutor;
    }
    private String nomeAutor = null;
    private String nmCitacao = null;
    private int idAutor;
    
    public Autor(String nomeAutor, String nmCitacao, int idAutor){
        this.nomeAutor = nomeAutor;
        this.nmCitacao = nmCitacao;
        this.idAutor = idAutor;
    }    
    /**
     * @return the nomeAutor
     */
    public String getNomeAutor() {
        return nomeAutor;
    }

    /**
     * @param nomeAutor the nomeAutor to set
     */
    public void setNomeAutor(String nomeAutor) {
        this.nomeAutor = nomeAutor;
    }

    /**
     * @return the nmCitacao
     */
    public String getNmCitacao() {
        return nmCitacao;
    }

    /**
     * @param nmCitacao the nmCitacao to set
     */
    public void setNmCitacao(String nmCitacao) {
        this.nmCitacao = nmCitacao;
    }
    
}
