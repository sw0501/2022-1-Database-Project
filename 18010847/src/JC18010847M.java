import java.awt.Container;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JLabel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class JC18010847M {

	static Connection con = null;

	public static void main(String[] args) {

		connectDB();
		savebasicTable();
		
		JFrame F = new JFrame("18010847 박상욱");

		F.setBounds(400, 200, 1500, 800);

		Container C = F.getContentPane();

		JPanel P = new JPanel();
		P.setLayout(null);

		setGUI(P);
		C.add(P);

		F.setVisible(true);
		F.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	public static void setGUI(JPanel panel) {

		JButton refresh = new JButton("DB 초기화");
		refresh.setBounds(10, 10, 200, 80);
		refresh.setFont(new Font("고딕", Font.ITALIC, 30));

		JButton Button1 = new JButton("모든 테이블 검색");
		JButton Button2 = new JButton("검색 1번");
		JButton Button3 = new JButton("검색 2번");
		JButton Button4 = new JButton("검색 3번");
		JButton Button6 = new JButton("입력");
		
		JTextField Button5 = new JTextField("테이블 입력");
		
		JTextField inputText1 = new JTextField("");
		JTextField inputText2 = new JTextField("");
		JTextField inputText3 = new JTextField("");
		JTextField inputText4 = new JTextField("");
		JTextField inputText5 = new JTextField("");
		JTextField inputText6 = new JTextField("");
		JTextField inputText7 = new JTextField("");
		JTextField inputText8 = new JTextField("");
		JTextField inputText9 = new JTextField("");
		JTextField inputText10 = new JTextField("");

		JLabel label1 = new JLabel("");
		JLabel label2 = new JLabel("");
		JLabel label3 = new JLabel("");
		JLabel label4 = new JLabel("");
		JLabel label5 = new JLabel("");
		JLabel label6 = new JLabel("");
		JLabel label7 = new JLabel("");
		JLabel label8 = new JLabel("");
		JLabel label9 = new JLabel("");
		JLabel label10 = new JLabel("");

		JButton ButtonT = new JButton("입력");

		Button1.setBounds(10, 130, 200, 80);
		Button1.setFont(new Font("고딕", Font.ITALIC, 20));
		Button2.setBounds(10, 250, 200, 80);
		Button2.setFont(new Font("고딕", Font.ITALIC, 30));
		Button3.setBounds(10, 370, 200, 80);
		Button3.setFont(new Font("고딕", Font.ITALIC, 30));
		Button4.setBounds(10, 490, 200, 80);
		Button4.setFont(new Font("고딕", Font.ITALIC, 30));
		Button5.setBounds(240, 10, 200, 40);
		Button5.setFont(new Font("고딕", Font.ITALIC, 20));
		Button6.setBounds(500, 10, 100, 40);
		Button6.setFont(new Font("고딕", Font.ITALIC, 20));
		inputText1.setBounds(320, 60, 120, 40);
		inputText1.setFont(new Font("고딕", Font.ITALIC, 20));
		label1.setBounds(240, 60, 60, 40);
		inputText2.setBounds(320, 110, 120, 40);
		inputText2.setFont(new Font("고딕", Font.ITALIC, 20));
		label2.setBounds(240, 110, 60, 40);
		inputText3.setBounds(320, 160, 120, 40);
		inputText3.setFont(new Font("고딕", Font.ITALIC, 20));
		label3.setBounds(240, 160, 60, 40);
		inputText4.setBounds(320, 210, 120, 40);
		inputText4.setFont(new Font("고딕", Font.ITALIC, 20));
		label4.setBounds(240, 210, 60, 40);
		inputText5.setBounds(320, 260, 120, 40);
		inputText5.setFont(new Font("고딕", Font.ITALIC, 20));
		label5.setBounds(240, 260, 60, 40);
		inputText6.setBounds(320, 310, 120, 40);
		inputText6.setFont(new Font("고딕", Font.ITALIC, 20));
		label6.setBounds(240, 310, 60, 40);
		inputText7.setBounds(320, 360, 120, 40);
		inputText7.setFont(new Font("고딕", Font.ITALIC, 20));
		label7.setBounds(240, 360, 60, 40);
		inputText8.setBounds(320, 410, 120, 40);
		inputText8.setFont(new Font("고딕", Font.ITALIC, 20));
		label8.setBounds(240, 410, 60, 40);
		inputText9.setBounds(320, 460, 120, 40);
		inputText9.setFont(new Font("고딕", Font.ITALIC, 20));
		label9.setBounds(240, 460, 60, 40);
		inputText10.setBounds(320, 510, 120, 40);
		inputText10.setFont(new Font("고딕", Font.ITALIC, 20));
		label10.setBounds(240, 510, 60, 40);
		ButtonT.setBounds(240, 560, 100, 40);
		ButtonT.setFont(new Font("고딕", Font.ITALIC, 20));

		inputText1.setVisible(false);
		inputText2.setVisible(false);
		inputText3.setVisible(false);
		inputText4.setVisible(false);
		inputText5.setVisible(false);
		inputText6.setVisible(false);
		inputText7.setVisible(false);
		inputText8.setVisible(false);
		inputText9.setVisible(false);
		inputText10.setVisible(false);

		ButtonT.setVisible(false);

		label1.setVisible(false);
		label2.setVisible(false);
		label3.setVisible(false);
		label4.setVisible(false);
		label5.setVisible(false);
		label6.setVisible(false);
		label7.setVisible(false);
		label8.setVisible(false);
		label9.setVisible(false);
		label10.setVisible(false);

		JTextArea Area = new JTextArea();
		JScrollPane scroll = new JScrollPane(Area);
		scroll.setBounds(500, 100,800, 480);

		refresh.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				SQL_scan("DROP TABLE Charts;");
				SQL_scan("DROP TABLE Treatments;");
				SQL_scan("DROP TABLE Patients;");
				SQL_scan("DROP TABLE Nurses;");
				SQL_scan("DROP TABLE Doctors;");

				SQL_scan("Create table if not exists Charts select * from saveCharts");
				SQL_scan("Create table if not exists Doctors select * from saveDoctors");
				SQL_scan("Create table if not exists Nurses select * from saveNurses");
				SQL_scan("Create table if not exists Patients select * from savePatients");
				SQL_scan("Create table if not exists Treatments select * from saveTreatments");

			}
		});

		Button1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Area.setText("charts Table : \n" + SQL_Q("select * from charts") + "doctors Table : \n"
						+ SQL_Q("select * from doctors") + "\n<NURSES>\n\n" + SQL_Q("select * from nurses")
						+ "patients Table : \n" + SQL_Q("select * from patients") + "treatments Table : \n"
						+ SQL_Q("select * from treatments"));
			}
		});

		Button2.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Area.setText(SQL_Q(
						"select pat_name, pat_addr, pat_phone, treat_contents, treat_date from Doctors D,Patients P left join Treatments on P.pat_id = Treatments.pat_id where D.doc_name = \"김병만\" && D.doc_id = P.doc_id;"));
			}
		});

		Button3.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Area.setText(SQL_Q(
						"select * from Doctors d where NOT EXISTS (select p.doc_id from Patients p where d.doc_id = p.doc_id);"));
			}
		});

		Button4.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {

				Area.setText(SQL_Q(
						"select * from doctors d where d.doc_id = (select p1.doc_id from patients p1 group by p1.doc_id having count(p1.doc_id) = (select max(cnt) from (select p2.doc_id, Count(p2.doc_id) as cnt from patients p2 group by p2.doc_id having count(p2.doc_id)) A));"));
			}
		});

		ButtonT.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				String inputValue = Button5.getText();
				if (inputValue.equalsIgnoreCase("charts")) {
					SQL_scan("INSERT INTO charts  VALUES (" + "'" + inputText1.getText() + "'" + ", "
							+ Integer.parseInt(inputText2.getText()) + ", " + Integer.parseInt(inputText3.getText())
							+ ", " + Integer.parseInt(inputText4.getText()) + ", "
							+ +Integer.parseInt(inputText5.getText()) + ", " + "'" + inputText6.getText() + "'" + ");");
				} else if (inputValue.equalsIgnoreCase("doctors")) {
					SQL_scan("INSERT INTO doctors VALUES (" + Integer.parseInt(inputText1.getText()) + ", " + "'"
							+ inputText2.getText() + "'" + ", " + "'" + inputText3.getText() + "'" + ", " + "'"
							+ inputText4.getText() + "'" + ", " + "'" + inputText5.getText() + "'" + ", " + "'"
							+ inputText6.getText() + "'" + ", " + "'" + inputText7.getText() + "'" + ");");
				} else if (inputValue.equalsIgnoreCase("nurses")) {
					SQL_scan("INSERT INTO nurses VALUES (" + Integer.parseInt(inputText1.getText()) + ", " + "'"
							+ inputText2.getText() + "'" + ", " + "'" + inputText3.getText() + "'" + ", " + "'"
							+ inputText4.getText() + "'" + ", " + "'" + inputText5.getText() + "'" + ", " + "'"
							+ inputText6.getText() + "'" + ", " + "'" + inputText7.getText() + "'" + ");");
				} else if (inputValue.equalsIgnoreCase("patients")) {
					SQL_scan("INSERT INTO patients VALUES (" + Integer.parseInt(inputText1.getText()) + ", "
							+ Integer.parseInt(inputText2.getText()) + ", " + Integer.parseInt(inputText3.getText())
							+ ", " + "'" + inputText4.getText() + "'" + ", " + "'" + inputText5.getText() + "'" + ", "
							+ Integer.parseInt(inputText6.getText()) + ", " + "'" + inputText7.getText() + "'" + ", "
							+ "'" + inputText8.getText() + "'" + ", " + "'" + inputText9.getText() + "'" + ", " + "'"
							+ inputText10.getText() + "'" + ");");
				} else if (inputValue.equalsIgnoreCase("treatments")) {
					SQL_scan("INSERT INTO treatments  VALUES (" + Integer.parseInt(inputText1.getText()) + ", "
							+ Integer.parseInt(inputText2.getText()) + ", " + Integer.parseInt(inputText3.getText())
							+ ", " + "'" + inputText4.getText() + "'" + ", " + "'" + inputText5.getText() + "'" + ");");
				}
			}
		});
		
		Button6.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String inputValue = Button5.getText().toLowerCase();
				
				inputText1.setVisible(false);
				inputText2.setVisible(false);
				inputText3.setVisible(false);
				inputText4.setVisible(false);
				inputText5.setVisible(false);
				inputText6.setVisible(false);
				inputText7.setVisible(false);
				inputText8.setVisible(false);
				inputText9.setVisible(false);
				inputText10.setVisible(false);
				
				label1.setVisible(false);
				label2.setVisible(false);
				label3.setVisible(false);
				label4.setVisible(false);
				label5.setVisible(false);
				label6.setVisible(false);
				label7.setVisible(false);
				label8.setVisible(false);
				label9.setVisible(false);
				label10.setVisible(false);
				
				inputText1.setText(" ");
				inputText2.setText(" ");
				inputText3.setText(" ");
				inputText4.setText(" ");
				inputText5.setText(" ");
				inputText6.setText(" ");
				inputText7.setText(" ");
				inputText8.setText(" ");
				inputText9.setText(" ");
				inputText10.setText(" ");
				
				
				if (inputValue.equalsIgnoreCase("charts".toUpperCase())) {
					inputText1.setVisible(true);
					inputText2.setVisible(true);
					inputText3.setVisible(true);
					inputText4.setVisible(true);
					inputText5.setVisible(true);
					inputText6.setVisible(true);
				
					label1.setVisible(true);
					label2.setVisible(true);
					label3.setVisible(true);
					label4.setVisible(true);
					label5.setVisible(true);
					label6.setVisible(true);
				

					ButtonT.setBounds(240, 560, 100, 40);

					label1.setText("chart_id".toUpperCase());
					label2.setText("treat_id".toUpperCase());
					label3.setText("doc_id".toUpperCase());
					label4.setText("pat_id".toUpperCase());
					label5.setText("nur_id".toUpperCase());
					label6.setText("char_contents".toUpperCase());
					ButtonT.setVisible(true);

				} else if (inputValue.equalsIgnoreCase("doctors".toUpperCase())) {
					inputText1.setVisible(true);
					inputText2.setVisible(true);
					inputText3.setVisible(true);
					inputText4.setVisible(true);
					inputText5.setVisible(true);
					inputText6.setVisible(true);
					inputText7.setVisible(true);
			
					label1.setVisible(true);
					label2.setVisible(true);
					label3.setVisible(true);
					label4.setVisible(true);
					label5.setVisible(true);
					label6.setVisible(true);
					label7.setVisible(true);
					

					ButtonT.setBounds(240, 560, 100, 40);

					label1.setText("doc_id".toUpperCase());
					label2.setText("major_treat".toUpperCase());
					label3.setText("doc_name".toUpperCase());
					label4.setText("doc_gen".toUpperCase());
					label5.setText("doc_phone".toUpperCase());
					label6.setText("doc_email".toUpperCase());
					label7.setText("doc_position".toUpperCase());
					ButtonT.setVisible(true);

				} else if (inputValue.equalsIgnoreCase("nurses".toUpperCase())) {
					inputText1.setVisible(true);
					inputText2.setVisible(true);
					inputText3.setVisible(true);
					inputText4.setVisible(true);
					inputText5.setVisible(true);
					inputText6.setVisible(true);
					inputText7.setVisible(true);
				
					label1.setVisible(true);
					label2.setVisible(true);
					label3.setVisible(true);
					label4.setVisible(true);
					label5.setVisible(true);
					label6.setVisible(true);
					label7.setVisible(true);
				
					ButtonT.setBounds(240, 560, 100, 40);

					label1.setText("nur_id".toUpperCase());
					label2.setText("major_job".toUpperCase());
					label3.setText("nur_name".toUpperCase());
					label4.setText("nur_gen".toUpperCase());
					label5.setText("nur_phone".toUpperCase());
					label6.setText("nur_email".toUpperCase());
					label7.setText("nur_position".toUpperCase());

					ButtonT.setVisible(true);

				} else if (inputValue.equalsIgnoreCase("patients".toUpperCase())) {
					inputText1.setVisible(true);
					inputText2.setVisible(true);
					inputText3.setVisible(true);
					inputText4.setVisible(true);
					inputText5.setVisible(true);
					inputText6.setVisible(true);
					inputText7.setVisible(true);
					inputText8.setVisible(true);
					inputText9.setVisible(true);
					inputText10.setVisible(true);

					label1.setVisible(true);
					label2.setVisible(true);
					label3.setVisible(true);
					label4.setVisible(true);
					label5.setVisible(true);
					label6.setVisible(true);
					label7.setVisible(true);
					label8.setVisible(true);
					label9.setVisible(true);
					label10.setVisible(true);

					ButtonT.setBounds(240, 560, 100, 40);

					label1.setText("pat_id".toUpperCase());
					label2.setText("nur_id".toUpperCase());
					label3.setText("doc_id".toUpperCase());
					label4.setText("pat_name".toUpperCase());
					label5.setText("pat_gen".toUpperCase());
					label6.setText("pat_jumin".toUpperCase());
					label7.setText("pat_addr".toUpperCase());
					label8.setText("pat_phone".toUpperCase());
					label9.setText("pat_email".toUpperCase());
					label10.setText("pat_job".toUpperCase());

					ButtonT.setVisible(true);

				} else if (inputValue.equalsIgnoreCase("treatments".toUpperCase())) {
					inputText1.setVisible(true);
					inputText2.setVisible(true);
					inputText3.setVisible(true);
					inputText4.setVisible(true);
					inputText5.setVisible(true);
				
					label1.setVisible(true);
					label2.setVisible(true);
					label3.setVisible(true);
					label4.setVisible(true);
					label5.setVisible(true);
				

					ButtonT.setBounds(240, 560, 100, 40);

					label1.setText("treat_id".toUpperCase());
					label2.setText("pat_id".toUpperCase());
					label3.setText("doc_id".toUpperCase());
					label4.setText("treat_contents".toUpperCase());
					label5.setText("treat_date".toUpperCase());

					ButtonT.setVisible(true);

				} else {
					JOptionPane ErrorCause = new JOptionPane();
					ErrorCause.showMessageDialog(null, "테이블이 존재하지 않습니다");
				}

			}
		});


		panel.add(refresh);
		panel.add(Button1);
		panel.add(Button2);
		panel.add(Button3);
		panel.add(Button4);
		panel.add(Button5);
		panel.add(Button6);

		panel.add(label1);
		panel.add(label2);
		panel.add(label3);
		panel.add(label4);
		panel.add(label5);
		panel.add(label6);
		panel.add(label7);
		panel.add(label8);
		panel.add(label9);
		panel.add(label10);

		panel.add(inputText1);
		panel.add(inputText2);
		panel.add(inputText3);
		panel.add(inputText4);
		panel.add(inputText5);
		panel.add(inputText6);
		panel.add(inputText7);
		panel.add(inputText8);
		panel.add(inputText9);
		panel.add(inputText10);

		panel.add(ButtonT);

		panel.add(scroll);
		Area.setCaretPosition(Area.getDocument().getLength());

	}

	private static void connectDB() {
		String url = "jdbc:mysql://localhost:3306/hospital?&serverTimezone=Asia/Seoul";
		String userid = "hospital";
		String pwd = "hospital";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("driver load success");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try { 
			System.out.println("ready to connect database");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("success connect database");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void savebasicTable() {
		SQL_scan("Create table if not exists saveCharts select * from Charts");
		SQL_scan("Create table if not exists saveDoctors select * from Doctors");
		SQL_scan("Create table if not exists saveNurses select * from Nurses");
		SQL_scan("Create table if not exists savePatients select * from Patients");
		SQL_scan("Create table if not exists saveTreatments select * from Treatments");
	}

	private static void SQL_scan(String query) {
		try {
			Statement Statement = con.createStatement();
			Statement.executeUpdate(query); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static String SQL_Q(String query) {

		String SQL_str = "";

		try {
			Statement Statement = con.createStatement();
			ResultSet Rset = Statement.executeQuery(query); 

			while (Rset.next()) {
				ResultSetMetaData RsetMetaData = Rset.getMetaData();
				int columnCount = RsetMetaData.getColumnCount();

				for (int i = 1; i <= columnCount; i++) {
					SQL_str += RsetMetaData.getColumnName(i) + ": " + Rset.getString(i) + "\t";
				}
				SQL_str += "\n";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return SQL_str;
	}

}
