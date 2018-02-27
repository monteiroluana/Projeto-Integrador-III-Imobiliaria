package br.senac.tads.pi3b.agenda;

import java.util.Date;

/**
 *
 * @author luana.mpereira5
 */
public class Pessoa {

    private long id;
    private String nome;
    private Date dtNasc;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDtNasc() {
        return dtNasc;
    }

    public void setDtNasc(Date dtNasc) {
        this.dtNasc = dtNasc;
    }

}
