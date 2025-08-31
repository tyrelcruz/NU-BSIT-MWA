import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

public class adminModule {
	// Containers
	JFrame adminMenu = new JFrame("Admin Menu | National University Philippines");
	JPanel panel1 = new JPanel();
	JPanel panel1A = new JPanel();
	JPanel panel2 = new JPanel();
	JPanel panel3 = new JPanel();

	// Components
	JLabel lblCourse = new JLabel("Course Code", SwingConstants.CENTER);
	JLabel lblCourseTitle = new JLabel("Course Title", SwingConstants.CENTER);
	JLabel lblCourseUnits = new JLabel("Course Units", SwingConstants.CENTER);

	JLabel lblAvCourses = new JLabel("Add Courses", SwingConstants.CENTER);

	JTextField txtCourses = new JTextField(1);
	JTextField txtCoursesTitle = new JTextField(1);
	JTextField txtCourseUnits = new JTextField(1);

	JTextArea availableCourses = new JTextArea(15, 0); // Maximum na isoshow ay 15 lines of courses
	JScrollPane scroll = new JScrollPane(availableCourses);

	JButton bttnAdd = new JButton("Add Course");
	JButton bttnView = new JButton("View Course");
	JButton bttnLogout = new JButton("Logout");

	ViewButtonHandler vbHandler;
	AddCourseButtonHandler acbHandler;
	LogoutButtonHandler loHandler;

	String inCourse = "";
	String inCourseTitle = "";
	String inCourseUnits = "";

	File inputFile = new File("Courses.txt");
	FileWriter fw = null;

	public adminModule() {
		adminMenu.setLayout(new GridLayout(4, 0, 2, 2));
		adminMenu.setSize(600, 400);
		adminMenu.setResizable(false);
		adminMenu.setDefaultCloseOperation(adminMenu.EXIT_ON_CLOSE);

		Toolkit tk = adminMenu.getToolkit();
		Dimension size = tk.getScreenSize();
		adminMenu.setLocation(size.width / 2 - adminMenu.getWidth() / 2, size.height / 2 - adminMenu.getHeight() / 2);

		lblAvCourses.setFont(new Font("Serif", Font.BOLD, 20));
		availableCourses.setEditable(false);
		availableCourses.setLineWrap(true);
		availableCourses.setWrapStyleWord(true);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

		// to center the panel
		Toolkit tkadmin = adminMenu.getToolkit();
		Dimension sizeadmin = tk.getScreenSize();
		adminMenu.setLocation(size.width / 2 - adminMenu.getWidth() / 2, size.height / 2 - adminMenu.getHeight() / 2);

		adminMenu.setVisible(true);

		// Panel 1
		panel1.setLayout(new GridLayout(1, 0));
		panel1.setBorder(BorderFactory.createEmptyBorder(5, 30, 0, 30));
		panel1.add(lblAvCourses);

		// Panel 1A
		panel1A.setLayout(new BoxLayout(panel1A, BoxLayout.Y_AXIS));
		panel1A.setBorder(BorderFactory.createEmptyBorder(0, 30, 0, 30));
		panel1A.add(scroll);

		// Panel 2
		panel2.setLayout(new GridLayout(3, 0));
		panel2.setBorder(BorderFactory.createEmptyBorder(10, 30, 5, 30));

		panel2.add(lblCourse);
		panel2.add(txtCourses);

		panel2.add(lblCourseTitle);
		panel2.add(txtCoursesTitle);

		panel2.add(lblCourseUnits);
		panel2.add(txtCourseUnits);

		// Panel 3
		panel3.setLayout(new GridLayout(2, 0));
		panel3.setBorder(BorderFactory.createEmptyBorder(10, 30, 20, 30));
		panel3.add(bttnAdd);
		panel3.add(bttnView);
		panel3.add(bttnLogout);

		adminMenu.add(panel1);
		adminMenu.add(panel1A);
		adminMenu.add(panel2);
		adminMenu.add(panel3);

		// Action Listeners

		loHandler = new LogoutButtonHandler();
		bttnLogout.addActionListener(loHandler);

		acbHandler = new AddCourseButtonHandler();
		bttnAdd.addActionListener(acbHandler);

		vbHandler = new ViewButtonHandler();
		bttnView.addActionListener(vbHandler);

	}

	private class ViewButtonHandler implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			try {
				readCourses();
			} catch (Exception ex) {
				System.out.println("An error has occured: " + ex.getMessage());
				;
			}
		}
	}

	private void readCourses() throws FileNotFoundException, IOException {
		availableCourses.setText(null);
		BufferedReader br = new BufferedReader(new FileReader("Courses.txt"));
		String line;
		while ((line = br.readLine()) != null) {
			availableCourses.append(line + "\n");
			// line = br.readLine();
		}
	}

	// ActionListener Methods
	private class AddCourseButtonHandler implements ActionListener {
		public void actionPerformed(ActionEvent e) {

			// This method checks if the text box is not empty, if it is not, it will
			// register the account
			// then goes to the fileIn() method.

			inCourse = txtCourses.getText();
			inCourseTitle = txtCoursesTitle.getText();
			inCourseUnits = txtCourseUnits.getText();

			// If else statement checking if the textbox are empty
			if (!(inCourse.isEmpty()) && !(inCourseTitle.isEmpty() && !(inCourseUnits.isEmpty()))) { // Checks if the
																										// textfield is
																										// not empty.
				try { // If not it calls fileIn()
					fileIn();
				} catch (IOException e1) {
					System.out.println("An error has occured: " + e1.getMessage());
				}
				// If it is not empty, it shows a dialogue that the account is registered.
				JOptionPane.showMessageDialog(null, "Course '" + inCourse + "' Added. Press OK to proceed.",
						"Course Added", JOptionPane.INFORMATION_MESSAGE);
				adminMenu.dispose();
				adminModule admin = new adminModule(); // goes back to admin menu
			} else { // Popup error message if textfield is empty.
				JOptionPane.showMessageDialog(null, "Input empty.", "Register Error", JOptionPane.ERROR_MESSAGE);
			}
		}
	}

	// fileIn method, this creates the file and inserts the data from the textbox in
	// said file.
	private void fileIn() throws FileNotFoundException, IOException {
		try {
			if (!inputFile.exists()) { // Checks if file exists, if not create a new one.
				System.out.println("We had to make a new file...");
				inputFile.createNewFile();
			} else {
				fw = new FileWriter(inputFile, true);

				BufferedWriter bw = new BufferedWriter(fw);
				bw.write(inCourseUnits + "\t\t" + inCourse + "\t\t" + inCourseTitle + "\n");
				bw.close();
				System.out.println("Completed.");
			}
		} catch (IOException e) {
			System.out.println("An error has occured: " + e.getMessage());
		} finally {
			try {
				fw.close();
			} catch (Exception e) {
			}
		}
	}

	// Action Listener for Logout Button
	private class LogoutButtonHandler implements ActionListener {
		public void actionPerformed(ActionEvent e) {
			adminMenu.dispose(); // closes current screen
			Login startMenu = new Login(); // goes back to login menu
		}
	}
}
