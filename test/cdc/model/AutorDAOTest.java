/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cdc.model;

import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.Before;

/**
 *
 * @author tatuapu
 */
public class AutorDAOTest {
    
    private AutorDAO dao;
    private int inserteID;
    
    @Before
    public void instanciaDAO() throws Exception{
        this.dao = new AutorDAO();
    }
    @Test(expected=java.lang.Exception.class)
    public void deveImpedirCadastroComObjetoNulo() throws Exception{
        this.dao.salvar(null);
    }
    
    @Test
    public void deveCadastrarUmAutorCorretamente() throws Exception{
        this.dao.salvar(new Autor("Paulo Coelho", "COELHO P.",0));
        this.inserteID = this.dao.getLastInsertedId();
        List<Autor> autores = this.dao.listaTodos();
        assertEquals(6,autores.size());
        this.removeDados();
    }
    private void removeDados() throws Exception{
        this.dao.excluir(new Autor(null,null,this.inserteID));
    }
    
}
