import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

public class Register {
	// Containers
	JFrame registerMenu = new JFrame("Register | National University Philippines");
	JPanel panel = new JPanel();
	JPanel panel1 = new JPanel();

	// Components
	JLabel lblUsername = new JLabel("Username: ", SwingConstants.CENTER);
	JLabel lblPassword = new JLabel("Password: ", SwingConstants.CENTER);
	JTextField txtUsername = new JTextField(15);
	JPasswordField txtPassword = new JPasswordField(8);
	JLabel lblRole = new JLabel("Choose your role: ", SwingConstants.CENTER);
	String[] role = { "Admin", "Student" };
	JComboBox<String> cmbRole = new JComboBox<>(role);

	JButton bttnSubmit = new JButton("Submit");
	JButton bttnReturn = new JButton("Return");

	private SubmitButtonHandler sbHandler;
	private ReturnButtonHandler rbHandler;
	
	String inUsername = "";
	String inPassword = "";
	String inRole = "";
	
	File inputFile = new File("Accounts.txt");
	FileWriter fw = null;

	public Register() {
		createRegisterUI(registerMenu);
		registerMenu.setLayout(new GridLayout());
		registerMenu.setSize(400, 210);
		registerMenu.setResizable(false);
		registerMenu.setDefaultCloseOperation(registerMenu.EXIT_ON_CLOSE);

		Toolkit tk = registerMenu.getToolkit();
		Dimension size = tk.getScreenSize();
		registerMenu.setLocation(size.width / 2 - registerMenu.getWidth() / 2,
				size.height / 2 - registerMenu.getHeight() / 2);

		// Panels
		panel1.setLayout(new GridLayout(4, 0));
		panel1.add(lblUsername);
		panel1.add(txtUsername);
		panel1.add(lblPassword);
		panel1.add(txtPassword);
		panel1.add(bttnSubmit);
		panel1.add(bttnReturn);
		panel1.add(lblRole);
		panel1.add(cmbRole);

		// Box
		Box b2 = Box.createHorizontalBox();
		b2.add(bttnReturn);
		b2.setBorder(BorderFactory.createEmptyBorder(2, 40, 5, 5));
		panel1.add(b2);

		Box b1 = Box.createHorizontalBox();
		b1.add(bttnSubmit);
		b1.setBorder(BorderFactory.createEmptyBorder(2, 40, 5, 5));
		panel1.add(b1);

		// Button Handlers

		rbHandler = new ReturnButtonHandler();
		bttnReturn.addActionListener(rbHandler);

		sbHandler = new SubmitButtonHandler();
		bttnSubmit.addActionListener(sbHandler);

		registerMenu.setVisible(true);
	}
	// Creates the UI look of the register menu
	private void createRegisterUI(JFrame registerMenu) {
		Border blackline = BorderFactory.createTitledBorder("Register");
		LayoutManager layout = new FlowLayout();
		panel.setLayout(layout);
		panel1.setBorder(blackline);
		panel.add(panel1);
		registerMenu.getContentPane().add(panel, BorderLayout.CENTER);

	}

	//ActionListener Methods
	private class SubmitButtonHandler implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			
			//This method checks if the text box is not empty, if it is not, it will register the account
			//then goes to the fileIn() method.
			
			inUsername = txtUsername.getText();
			inPassword = txtPassword.getText();
			inRole = cmbRole.getSelectedItem().toString();

			//If else statement checking if the textbox are empty
			if(!(inUsername.isEmpty()) && !(inPassword.isEmpty())) { //Checks if the textfield is not empty.
				try { //If not it calls fileIn()
					fileIn();
				}catch (IOException e1) {
					System.out.println("An error has occured: "+e1.getMessage());
				}
				//If it is not empty, it shows a dialogue that the account is registered.
				JOptionPane.showMessageDialog(null, "Account '"+inUsername+"' registered. Press OK to proceed.", "Register Confirmed",JOptionPane.INFORMATION_MESSAGE);
				registerMenu.dispose();
				Login startMenu = new Login();
			}else { //Popup error message if textfield is empty.
				JOptionPane.showMessageDialog(null, "Input empty. Enter a valid username and password.", "Register Error",
						JOptionPane.ERROR_MESSAGE);
			}
		}
	}

	private class ReturnButtonHandler implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			registerMenu.dispose(); //closes current screen
			Login startMenu = new Login(); //goes back to login menu
		}
	}
	
	//fileIn method, this creates the file and inserts the data from the textbox in said file.
	private void fileIn() throws FileNotFoundException, IOException {
		try {
			if(!inputFile.exists()) { //Checks if file exists, if not create a new one.
				System.out.println("We had to make a new file...");
				inputFile.createNewFile();
			}else {
				fw = new FileWriter(inputFile, true);
				
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(inUsername + " " + inPassword + " " + inRole + "\n");
				bw.close();
				System.out.println("Completed.");
			}
		}
		catch(IOException e) {
			System.out.println("An error has occured: "+e.getMessage());
		}
		finally{
		try {fw.close();} catch(Exception e) {}	
		}
	}

}
