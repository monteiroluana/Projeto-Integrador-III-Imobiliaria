package br.com.evolution.conexao;

import br.com.evolution.dao.DaoUsuario;
import br.com.evolution.model.Usuario;
import java.sql.SQLException;
import java.util.List;

public class testeConexao {

    public static void main(String[] args) throws SQLException {
        DaoUsuario daoUsuario = new DaoUsuario();

//        Usuario user = new Usuario();
//        user.setNome("Kunieda Aoi");
//        user.setLogin("kunieda.aoi");
//        user.setSenha("aoi");
//        user.setGrupoFilial("RioDeJaneiro");
//        user.setDepartamento("");
//        user.setCargo("");
//
//        daoUsuario.iserir(user);


        try {
            List<Usuario> lista = daoUsuario.listar();

            for (Usuario u : lista) {
                System.out.println("Nome: " + u.getNome() + " "
                        + "Login: " + u.getLogin() + " "
                        + "Senha: " + u.getSenha());
            }

        } catch (ClassNotFoundException ex) {
            System.err.println(ex.getMessage());
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

    }
}
