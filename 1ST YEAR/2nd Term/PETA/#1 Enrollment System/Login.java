import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

public class Login {
	// Containers
	JFrame startMenu = new JFrame("Login | National University Philippines");
	JPanel panel = new JPanel();
	JPanel panel1 = new JPanel();

	// Components
	JLabel lblUsername = new JLabel("Username: ", SwingConstants.CENTER);
	JLabel lblPassword = new JLabel("Password: ", SwingConstants.CENTER);
	JTextField txtUsername = new JTextField(15); 
	JPasswordField txtPassword = new JPasswordField(8); 
	
	JButton bttnLogin = new JButton("Login");
	JButton bttnExit = new JButton("Exit");
	JButton bttnRegister = new JButton("Register");
	
	private LoginButtonHandler lbHandler;
	private RegisterButtonHandler rbHandler;
	private ExitButtonHandler ebHandler;
	
	FileReader fr = null;
	BufferedReader br = null;

	public Login() {
		createLoginUI(startMenu);
		startMenu.setLayout(new GridLayout());
		startMenu.setSize(400, 180);
		startMenu.setResizable(false);
		startMenu.setDefaultCloseOperation(startMenu.EXIT_ON_CLOSE);

		Toolkit tk = startMenu.getToolkit();
		Dimension size = tk.getScreenSize();
		startMenu.setLocation(size.width / 2 - startMenu.getWidth() / 2, size.height / 2 - startMenu.getHeight() / 2);

		// Panels
		panel1.setLayout(new GridLayout(3,0));
		panel1.add(lblUsername);
		panel1.add(txtUsername);
		panel1.add(lblPassword);
		panel1.add(txtPassword);
		panel1.add(bttnRegister);
		panel1.add(bttnLogin);
		panel1.add(bttnExit);
		
		//Box
		Box b2 = Box.createHorizontalBox();
		b2.add(bttnRegister);
		b2.setBorder(BorderFactory.createEmptyBorder(2,40,5,5));
		panel1.add(b2);
		
		Box b1 = Box.createHorizontalBox();
		b1.add(bttnLogin);
		b1.add(bttnExit);
		b1.setBorder(BorderFactory.createEmptyBorder(2,15,5,5));
		panel1.add(b1);
		
		//Button Handlers
		
		ebHandler = new ExitButtonHandler();
		bttnExit.addActionListener(ebHandler);
		
		rbHandler = new RegisterButtonHandler();
		bttnRegister.addActionListener(rbHandler);
		
		lbHandler = new LoginButtonHandler();
		bttnLogin.addActionListener(lbHandler);

		startMenu.setVisible(true);
	}
	// Creates the UI look of the login menu
	public void createLoginUI(JFrame startMenu) {
		Border blackline = BorderFactory.createTitledBorder("Login");
		LayoutManager layout = new FlowLayout();
		panel.setLayout(layout);
		panel1.setBorder(blackline);
		panel.add(panel1);
		startMenu.getContentPane().add(panel, BorderLayout.CENTER);
	}
	
	// ActionListener Methods
	
	private class RegisterButtonHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			startMenu.dispose(); //closes current screen
			Register registerMenu = new Register(); //opens register screen
		}
	}
	
	private class LoginButtonHandler implements ActionListener{
                @Override
		public void actionPerformed(ActionEvent e) {
			try {
				String username = txtUsername.getText();
				String password = txtPassword.getText();
				String adminRole = "Admin";
				
				//This is the file path, please change it to your pc's own path
				fr = new FileReader("C:\\Users\\Tyrel\\Documents\\NetBeansProjects\\FINALPROJECT\\Accounts.txt");
				br = new BufferedReader(fr);
				String line, user, pass, role;
				boolean isLoginSuccess = false;
				
				//A while loop checking the inputed file
				while((line = br.readLine()) != null) {
					 user = line.split(" ")[0]; //Simple regex function
					 pass = line.split(" ")[1];
					 role = line.split(" ")[2];
					 
					 //If else statement comparing data from the file to the input text
					 if(user.equals(username) && pass.equals(password)) {
						 //If both are equal, another if else statement will happen checking
						 //whether the registered account is admin or not.
						 if(role.equals(adminRole)) {
							 isLoginSuccess = true;
							 startMenu.dispose();
							 adminModule admin = new adminModule();
							 break;
						 }
						 else {
							 isLoginSuccess = true;
							 startMenu.dispose();
							 studentModule student = new studentModule();
							 break;
						 }
					 }
				 }
				 if(!isLoginSuccess) {
					 JOptionPane.showMessageDialog(null, "This username/password is unregistered.", "Login Error", JOptionPane.WARNING_MESSAGE);
				 }
				 fr.close();
			}
			catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
	}
	
	private class ExitButtonHandler implements ActionListener{
		public void actionPerformed(ActionEvent e) {
			System.exit(0);
		}
	}

}
