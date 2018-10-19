import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HandleConnection implements Runnable {

    private Socket connection;
    private DataInputStream dis;
    private DataOutputStream dos;
    final static String INET_ADDR = "224.0.0.3";
    
    
    final static int PORT = 8888;
    public HandleConnection(Socket connection) {
        this.connection = connection;
    }

    @Override
    public void run() {
        System.out.println("Handling connection...");
        while(true){
        try {
            dis = new DataInputStream(connection.getInputStream());
            dos = new DataOutputStream(connection.getOutputStream());
            String serverAction = dis.readUTF(); //Acao a ser feita, pode ser Send to group, Join group, Leave group
            String msg2;
            
            if(serverAction.equals("Join group")){
                if(!MyServerSocket.group.contains(connection))
                        MyServerSocket.group.add(connection);
                
                dos.writeUTF("OK");
                dos.flush();
            }else if (serverAction.equals("Leave group")){
                MyServerSocket.group.remove(connection);
                dos.writeUTF("OK");
                dos.flush();
            }else if (serverAction.equals("Send to group")){
                System.out.println("Passou aqui");
                msg2 = dis.readUTF();
                sendMessage(msg2);

            }
            
                /*
                if (serverAction.equals("Message to server")) {
                receiveMessage(); //Receber mensagem
                } else if (serverAction.equals("Message from server")) {
                serverAction = dis.readUTF();
                sendMessage(serverAction); //Enviar mensagem
                }
                else if(serverAction.equals("Message from server2")){
                
                }*/
                //this.wait(1000);
            
            
            
        } catch (IOException e) {
            e.printStackTrace();
        }}
    }

    private void receiveMessage() throws IOException {
        String msg = dis.readUTF(); //Le String do cliente
        System.out.println("Received message: " + msg );
        

    }

    private void sendMessage(String msg) throws IOException {
        
        for(Socket auxiliar: MyServerSocket.group){
            DataOutputStream dos1 = new DataOutputStream(auxiliar.getOutputStream());
            dos1.writeUTF(msg); //Escreve String para o cliente
            dos1.flush();
        }
        System.out.println("Sent message: " + msg);
    }
}
