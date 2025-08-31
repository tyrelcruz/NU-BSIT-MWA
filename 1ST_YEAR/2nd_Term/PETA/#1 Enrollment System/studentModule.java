import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;

public class studentModule {

	// Containers
	JFrame studentMenu = new JFrame("Student Menu | National University Philippines");
	JPanel panel1 = new JPanel();
	JPanel panel1A = new JPanel();
	JPanel panel2 = new JPanel();
	JPanel panel3 = new JPanel();

	// Components
	JButton bttnEnroll = new JButton("Enroll Course");
	JButton bttnView = new JButton("View Course");
	JButton bttnLogout = new JButton("Logout");
	JButton bttnCheck = new JButton("Check Enrolled Course");

	JLabel lblFullName = new JLabel("Full Name: ", SwingConstants.CENTER);
	JLabel lblCrseCode = new JLabel("Course Code: ", SwingConstants.CENTER);
	JLabel lblAvCourses = new JLabel("Available Courses", SwingConstants.CENTER);

	JTextField txtName = new JTextField(1);
	JTextField txtCode = new JTextField(1);

	JTextArea availableCourses = new JTextArea(15, 0);
	JScrollPane scroll = new JScrollPane(availableCourses);

	ViewButtonHandler vbHandler; // regex search using full name to search enrollment.txt
	EnrollButtonHandler enHandler;
	LogoutButtonHandler loHandler;
	CheckButtonHandler chHandler;

	String fullName = "";
	String course = ""; // possible na ichange to from inputting course code to course title instead
	// pero problem is regex extraction kung kukunin lang course title
	// suggestion na with regex search, regex search enrollment.txt using full name
	// and display lines na nagmatch.

	File inFile = new File("Enrollment.txt"); // file stores the enrolled courses from the user
	FileWriter fw = null;
	FileReader fr = null;

	public studentModule() {
		studentMenu.setLayout(new GridLayout(4, 0, 2, 2));
		studentMenu.setSize(600, 400);
		studentMenu.setResizable(false);
		studentMenu.setDefaultCloseOperation(studentMenu.EXIT_ON_CLOSE);

		lblAvCourses.setFont(new Font("Serif", Font.BOLD, 30));
		availableCourses.setEditable(false);
		availableCourses.setLineWrap(true);
		availableCourses.setWrapStyleWord(true);
		scroll.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

		// to center the panel
		Toolkit tk = studentMenu.getToolkit();
		Dimension size = tk.getScreenSize();
		studentMenu.setLocation(size.width / 2 - studentMenu.getWidth() / 2,
				size.height / 2 - studentMenu.getHeight() / 2);

		studentMenu.setVisible(true);

		// Panel 1
		panel1.setLayout(new GridLayout(1, 0));
		panel1.setBorder(BorderFactory.createEmptyBorder(5, 30, 0, 30));
		panel1.add(lblAvCourses);
		// panel1.add(lblInfo);
		// panel1.add(availableCourses);
		// studentMenu.getContentPane().add(panel1, BorderLayout.WEST);

		// Panel 1A
		panel1A.setLayout(new BoxLayout(panel1A, BoxLayout.Y_AXIS));
		panel1A.setBorder(BorderFactory.createEmptyBorder(0, 30, 0, 30));
		panel1A.add(scroll);
		// Panel 2
		// panel2.add(txtCourses);
		panel2.setLayout(new GridLayout(2, 0));
		panel2.setBorder(BorderFactory.createEmptyBorder(10, 30, 5, 30));
		panel2.add(lblFullName);
		panel2.add(txtName);
		panel2.add(lblCrseCode);
		panel2.add(txtCode);
		// studentMenu.getContentPane().add(panel2, BorderLayout.EAST);

		// Panel 3
		panel3.setLayout(new GridLayout(2, 0));
		panel3.setBorder(BorderFactory.createEmptyBorder(10, 30, 20, 30));
		panel3.add(bttnView);
		panel3.add(bttnEnroll);
		panel3.add(bttnCheck);
		panel3.add(bttnLogout);
		// studentMenu.getContentPane().add(panel3, BorderLayout.SOUTH);

		studentMenu.add(panel1);
		studentMenu.add(panel1A);
		studentMenu.add(panel2);
		studentMenu.add(panel3);

		loHandler = new LogoutButtonHandler();
		bttnLogout.addActionListener(loHandler);

		enHandler = new EnrollButtonHandler();
		bttnEnroll.addActionListener(enHandler);

		vbHandler = new ViewButtonHandler();
		bttnView.addActionListener(vbHandler);

		chHandler = new CheckButtonHandler();
		bttnCheck.addActionListener(chHandler);
	}

	private class EnrollButtonHandler implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			// writes inputted text fields into Enrollment.txt
			fullName = txtName.getText();
			course = txtCode.getText();

			if (!(fullName.isEmpty()) && !(course.isEmpty())) {
				try {
					enrollFile();
				} catch (Exception ex) {
					System.out.println("An exception has occured!: " + ex.getMessage());
				}

				JOptionPane.showMessageDialog(null, "Student " + fullName + " has been enrolled" + " to course "
						+ course + ".\n Press OK to proceed", "Student Enrolled", JOptionPane.INFORMATION_MESSAGE);
				studentMenu.dispose();
				studentModule student = new studentModule();
			} else {
				JOptionPane.showMessageDialog(null, "Input empty", "Enrollment Error", JOptionPane.ERROR_MESSAGE);
			}
		}

		private void enrollFile() throws FileNotFoundException, IOException {
			if (!inFile.exists()) {
				System.out.println("Creating a new file...");
				inFile.createNewFile();
				fw = new FileWriter(inFile, true);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write("Name: " + fullName + " " + "Course: " + course + "\n");
				bw.close();
				System.out.println("Enrolled.");
			} else {
				fw = new FileWriter(inFile, true);
				BufferedWriter bw = new BufferedWriter(fw);
				bw.write("Name: " + fullName + " # " + "Course: " + course + "\n");
				bw.close();
				System.out.println("Enrolled.");
			}
		}
	}

	private class ViewButtonHandler implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			try {
				readCourses();
			} catch (Exception ex) {
				System.out.println("An error has occured: " + ex.getMessage());
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
	}

	private class CheckButtonHandler implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			fullName = txtName.getText();
			if (!(fullName.isEmpty())) {
				try {
					isEnrolledIn();
				} catch (IOException ex) {
					System.out.println("An exception has occured: " + ex.getMessage());
				}
			} else {
				JOptionPane.showMessageDialog(null, "Student Name field is empty. Please enter a name.",
						"Check Course Error", JOptionPane.ERROR_MESSAGE);
			}
		}

		private void isEnrolledIn() throws FileNotFoundException, IOException {
			fr = new FileReader("Enrollment.txt");
			BufferedReader br = new BufferedReader(fr);
			String pattern = "(?i)(.*)(" + fullName + ")(.*)";

			if (inFile.exists()) {
				try {
					String text;
					while ((text = br.readLine()) != null) {
						if (text.matches(pattern)) {
							String courses = text.split("Course: ")[1];
							JOptionPane.showMessageDialog(null, "You have been enrolled on the course(s): " + courses,
									"Enrolled Courses", JOptionPane.INFORMATION_MESSAGE);
						} else {
							continue;
						}
					}
				} catch (Exception ex) {
					System.out.println("An error has occured" + ex.getMessage());
				}
			} else {
				System.out.println("You have not enrolled yet.");
			}
		}
	}

	private class LogoutButtonHandler implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			studentMenu.dispose(); // closes student menu
			Login startMenu = new Login(); // goes back to the login menu
		}
	}
}
