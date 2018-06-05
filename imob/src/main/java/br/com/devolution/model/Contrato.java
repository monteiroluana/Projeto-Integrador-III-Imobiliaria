package br.com.devolution.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Contrato {

    private int idContrato;
    private int codContrato;
    private int idImovel;
    private int idCliente;
    private int idUsuario;


    private Date dataContrato;
    private Date dataInicial;
    private Date dataFinal;

    private String corretor;
    private String tipoContrato;
    private String tipoImovel;
    private String locatario;

    public int getCodContrato() {
        return codContrato;
    }

    public void setCodContrato(int codContrato) {
        this.codContrato = codContrato;
    }

    public int getIdImovel() {
        return idImovel;
    }

    public void setIdImovel(int idImovel) {
        this.idImovel = idImovel;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Date getDataContrato() {
        return dataContrato;
    }

    public void setDataContrato(String dataContrato) {
        DateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");

        try {
            this.dataContrato = formatador.parse(dataContrato);
        } catch (ParseException e) {

        }
    }

    public Date getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(String dataInicial) {
        DateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");

        try {
            this.dataInicial = formatador.parse(dataInicial);
        } catch (ParseException e) {

        }
    }

    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(String dataFinal) {
        DateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");

        try {
            this.dataFinal = formatador.parse(dataFinal);
        } catch (ParseException e) {

        }
    }

    public String getCorretor() {
        return corretor;
    }

    public void setCorretor(String corretor) {
        this.corretor = corretor;
    }

    public String getTipoContrato() {
        return tipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    public int getIdContrato() {
        return idContrato;
    }

    public void setIdContrato(int idContrato) {
        this.idContrato = idContrato;
    }

    public String getTipoImovel() {
        return tipoImovel;
    }

    public void setTipoImovel(String tipoImovel) {
        this.tipoImovel = tipoImovel;
    }

    public String getLocatario() {
        return locatario;
    }

    public void setLocatario(String locatario) {
        this.locatario = locatario;
    }    
    
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
}
