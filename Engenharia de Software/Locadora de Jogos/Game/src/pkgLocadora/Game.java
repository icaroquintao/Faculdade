package pkgLocadora;

import java.util.ArrayList;

/**
 *
 *
 */
public class Game {

    private ArrayList<Cliente> clientes = new ArrayList<>();
    private ArrayList<Jogos> jogos = new ArrayList<>();
    private ArrayList<Locacao> locacoes = new ArrayList();
    private ArrayList<Jogos> jogosLocados = new ArrayList<>();
    private Funcionario operador = new Funcionario();
    private double lucro;

    public Game(){

    }

    public boolean cadastrarPessoa(Cliente p) {
        for (Pessoa i : clientes) {
            if (i.getCpf().equals(p.getCpf())) {
                return false;
            }
        }
        clientes.add(p);
        return true;
    }

    public boolean removerPessoa(String cpf){
        for(Pessoa i : clientes){
            if(i.getCpf().equals(cpf)){
                clientes.remove(i);
                return true;
            }
        }
        return false;
    }

    public boolean cadastrarJogos(Jogos novo){
        jogos.add(novo);
        return true;
    }

    public boolean removerJogos(int codigo){
        for (Jogos i : jogos){
            if(i.getCodigo() == codigo){
                jogos.remove(i);
            return true;
            }
        }
        return false;
    }
    public String buscaPessoa(String cpf){
        for (int i = 0; i < clientes.size(); i++) {
            if(clientes.get(i).getCpf().equals(cpf)){
                return clientes.get(i).toString();
            }
        }
        return "Pessoa não encontrada!";
    }

    public String buscaJogos(String titulo){

        for(int i=0; i< jogos.size(); i++){
            if(titulo.equals(jogos.get(i).getTitulo())){
                return jogos.get(i).imprimeJogos();
            }
        }
    return "Jogo não encontrado";
    }

    public String buscaJogosCodigo(int codigo){

        for(int i=0; i< jogos.size(); i++){
            if(codigo == jogos.get(i).getCodigo()){
                return jogos.get(i).imprimeJogos();
            }
        }
    return "Jogo não encontrado";
    }

    public String concatenaJogos(){
        String str = "";
        for(Jogos a : jogos){
            str += a.imprimeLista();
        }

        return str;
    }

    public String concatenaPessoas(){
        String str = "";
        for(Pessoa a : clientes){
            str += a.imprimeLista();
        }

        return str;
    }

    public String AlugarJogos (int codigo, String cpf){
        boolean livroBuscado = false;
        boolean pessoaBuscada = false;
        int iJogos = 0, iPessoa = 0;
        double preco = 0.0;

        for(int i=0; i< jogos.size(); i++){
            if(codigo == jogos.get(i).getCodigo()){
               if(jogos.get(i).isLocado()){
                   return "Jogos já Locado!";
               }
               else{
               livroBuscado = true;
               iJogos = i;
               break;
               }
            }
        }
        if(livroBuscado == false){
            return "livro não encontrado!";
        }
        else{
            for (int i = 0; i < clientes.size(); i++) {
                if(clientes.get(i).getCpf().equals(cpf)){
                    pessoaBuscada = true;
                    iPessoa = i;
                    break;
                }
            }
            if(pessoaBuscada == false){
                return "Pessoa não encontrada!";
            }
            else{

                clientes.get(iPessoa).getJogosCliente().add(jogos.get(iJogos));
                jogos.get(iJogos).setLocado(true);

                preco = jogos.get(iJogos).getReal() - clientes.get(iPessoa).getDesconto();

                clientes.get(iPessoa).setSaldoModificado(preco);
                lucro += preco;
                Locacao nova = new Locacao(operador, clientes.get(iPessoa), jogos.get(iJogos));
                locacoes.add(nova);

                return "Locação Efetivada!";
            }
        }
    }

    public String devolverJogos(int codigo, String cpf){
        double preco = 0.0;
        for (int iP = 0; iP < clientes.size(); iP++) {
            if(clientes.get(iP).getCpf().equals(cpf)){

                for (int iM=0 ; iM < clientes.get(iP).getJogosCliente().size() ; iM++) {
                    if(codigo == clientes.get(iP).getJogosCliente().get(iM).getCodigo()){

                        preco = clientes.get(iP).getJogosCliente().get(iM).getReal() - clientes.get(iP).getDesconto();
                        clientes.get(iP).setSaldoModificado(-preco);

                        clientes.get(iP).getJogosCliente().remove(iM);
                        for(int i=0; i< jogos.size(); i++){
                            if(codigo == jogos.get(i).getCodigo()){
                                jogos.get(i).setLocado(false);
                                for (int j = 0; j < locacoes.size(); j++) {
                                    if(codigo == locacoes.get(j).getJogosLocado().getCodigo()){
                                        locacoes.remove(j);
                                        break;
                                    }
                                }
                                return "Devolução Concluída!";
                            }
                        }
                    }
                }
            }
        }
        return "Erro na Devolução! Verifique as informações";
    }

    public String listaJogosAlocado(){
        int codigo;
        String str = "Jogos: " + jogos.size()+
                     "\nJogos locados: " + locacoes.size()+
                     "\nLucro: R$" + lucro;
        for(int i=0; i< locacoes.size(); i++){
            str += "\n\nLocações: \nTitulo: " + locacoes.get(i).getJogosLocado().getTitulo() +
                   "\nCódigo: " + locacoes.get(i).getJogosLocado().getCodigo()+
                   "\nLocado por: " + locacoes.get(i).getCliente().getNome() +
                   "\nOperador: " + locacoes.get(i).getOperador().getNome();
        }
        return str;
    }

    public void imprimeArrayJogos(){
        for(Jogos a : jogos){
            System.out.println(a.imprimeJogos());
        }

    }

    public ArrayList<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(ArrayList<Cliente> clientes) {
        this.clientes = clientes;
    }

    public ArrayList<Jogos> getJogos() {
        return jogos;
    }

    public void setJogos(ArrayList<Jogos> jogos) {
        this.jogos = jogos;
    }

    public Funcionario getOperador() {
        return operador;
    }

    public void setOperador(Funcionario operador) {
        this.operador = operador;
    }


}
