
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

public class MyServerSocket implements Runnable {

    private boolean connected = false;
    private ServerSocket serverSocket = null;
    private Socket connection = null;
    private HandleConnection handle = null;
    public static ArrayList<Socket> group = new ArrayList<>();
    public MyServerSocket() {

    }

    @Override
    public void run() {
        try {
            serverSocket = new ServerSocket(8080); //Port 8080
            JOptionPane.showMessageDialog(null, "Server is running");
            connected = true;
            int i=1;
            while (connected) {
                System.out.println("Waiting for connections...");
                connection = serverSocket.accept();
                handle = new HandleConnection(connection);
                Thread handleConnection = new Thread(handle);
                handleConnection.start();
                System.out.println("Thread to handle connection "+ i + " is running...");
            }
        } catch (SocketException e) {
            System.out.println("Server stopped.");            
            JOptionPane.showMessageDialog(null, "Server stopped.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void disconnect() {
        try {
            if (serverSocket != null) {
                serverSocket.close();
                connected = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "An exception occurred.");
        }
    }

}