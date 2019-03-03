import java.sql.*;

public class HW5{
	public static void main(String[] args){
		//**********************************
		//**********************************
		// Establish database connection.
		//**********************************
		//**********************************
				Statement st = null;
				Statement stmt = null;
				try {
					Class.forName("oracle.jdbc.OracleDriver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}// end catch
				Connection c = null;
				try {
					System.out.println("********************************************");
					System.out.println("Connecting to the database...");
					 c = DriverManager.getConnection("jdbc:oracle:thin:@acadoradbprd01.dpu.depaul.edu:1521:ACADPRD0", 
							 "XMO",
							"cdm1360075");
					System.out.println("Oracle Database has been successfully connected! ");
					st = c.createStatement();
				} catch (SQLException e) {
					System.out.println(e);
					System.exit(1);
				} //end catch
				
			//********************************************************************
			//********************************************************************
			//With a single query, 
			//display the average number of days that each part spent in transit. 
			//Round the answers to a whole day.
			//********************************************************************
			//********************************************************************	
				String userTable = "shipments";
				System.out.println("**********************************************");
				System.out.println("Printing out table: "+userTable+"...");
				try{
					//String sql1 = "ALTER TABLE shipments ADD (shipdate      DATE, arrivaldate   DATE)";
					String sql = "INSERT INTO SHIPMENTS(shipdate,arrivaldate) VALUES(TO_DATE(?,'mm/dd/yy'),TO_DATE(?,'mm/dd/yy'))" ;
					PreparedStatement ps =  c.prepareStatement(sql);
					String[] shipdate = {"1/5/18",
										"2/1/18",
										"12/15/17",
										"11/2/17",
										"8/5/17",
										"8/5/17",
										"7/3/17",
										"9/3/17",
										"2/5/18",
										"1/6/18",
										"3/5/18",
										"2/27/18",
										"6/15/17",
										"6/17/17",
										"5/2/17",
										"5/5/17",
										"9/15/17",
										"10/2/17",
										"11/5/17",
										"12/12/17",
										"12/22/17",
										"5/7/18",
										"4/23/18",
										"4/20/18"
										};
					String[] arrivaldate = {"1/25/19",
											"2/4/18",
											"1/8/18",
											"11/18/17",
											"9/1/17",
											"8/9/17",
											"7/29/17",
											"9/10/17",
											"2/15/18",
											"1/14/18",
											"3/15/18",
											"3/6/18",
											"6/27/17",
											"6/30/17",
											"6/2/17",
											"5/10/17",
											"10/1/17",
											"10/23/17",
											"11/17/17",
											"1/4/18",
											"1/16/18",
											"6/1/18",
											"5/2/18",
											"5/2/18"};
					for (int i=0; i< shipdate.length; i++){
						ps.setString(1, shipdate[i]);
						ps.setString(2, arrivaldate[i]);
						ps.executeUpdate();
					}
					System.out.println ("Table " + userTable + " has been populated.");
				}catch(SQLException e){
					e.printStackTrace();
				}//end catch
				
				try{
				ResultSet resultSet = st.executeQuery(
						"SELECT partno, Round(AVG(arrivaldate - shipdate),0)"
						+" FROM SHIPMENTS GROUP BY partno ORDER BY partno ASC"
								);
				ResultSetMetaData rsmd = resultSet.getMetaData();
				int columnsNumber = rsmd.getColumnCount();
				System.out.println("Part Number       Average Duration");
				System.out.println("_____________________________________________________");
				while (resultSet.next()) {
				    for (int i = 1; i <= columnsNumber; i++) {
				        if (i > 1) System.out.print("         |       ");
				        String columnValue = resultSet.getString(i);
				        System.out.print(columnValue + " " );
				    }
				    System.out.println("");
				}
				}catch(SQLException e){
					e.printStackTrace();
				}//end catch
				
				//********************************************************************
				//********************************************************************
				//With a single query, for each project, 
				//display the number of parts delivered in 2017.
				//********************************************************************
				//********************************************************************	
				System.out.println("With a single query, for each project, display the number of parts delivered in 2017.");
				
				try{
					
					ResultSet resultSet = st.executeQuery(" SELECT shipments.projectno, COUNT(partno)" +
							" FROM shipments,projects"+
							" WHERE shipments.projectno (+) = projects.projectno"+
							" AND shipments.arrivaldate <= TO_DATE('12/31/17', 'MM/DD/YY')"+
							" GROUP BY shipments.projectno "+
							" ORDER BY shipments.projectno ASC"

									);
					ResultSetMetaData rsmd = resultSet.getMetaData();
					int columnsNumber = rsmd.getColumnCount();
					System.out.println("Project Number     Part Quantity");
					System.out.println("_____________________________________________________");
					while (resultSet.next()) {
					    for (int i = 1; i <= columnsNumber; i++) {
					        if (i > 1) System.out.print("         |       ");
					        String columnValue = resultSet.getString(i);
					        System.out.print(columnValue + " " );
					    }
					    System.out.println("");
					}
					}catch(SQLException e){
						e.printStackTrace();
					}//end catch
				
	}//end main
}//end class