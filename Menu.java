import java.util.Scanner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.ResultSetMetaData;

public class Menu{
    private static Scanner sc= new Scanner(System.in);

    public static int menu()
    {
        System.out.println("Q1 List the Manager�s name and telephone number for each residence hall");
        System.out.println("Q2 list the names and MUnumbers of students with the details of their lease agreements");
        System.out.println("Q3 Display lease agreements that include the summer semester.");
        System.out.println("Q4 Display total rent paid by a given student.");
        System.out.println("Q5 Report on students that have not paid by a certain date.");
        System.out.println("Q6 Details of inspections that were not satisfactory.");
        System.out.println("Q7 Names and MUnumbers of students with their room number and place number in a particular hall of residence.");
        System.out.println("Q8 List of students currently on the waiting list.");
        System.out.println("Q9 Total number of students in each level.");
        System.out.println("Q10 Names and MUNumbers of students that have not given NOK.");
        System.out.println("Q11 Name and phone number of advisor for a particular student.");
        System.out.println("Q12 minimum, maximum, and average monthly rent for rooms in residence halls.");
        System.out.println("Q13 Total number of places in each residence hall.");
        System.out.println("Q14 staff number, name, age, and current location of all members of the residence staff who are over 60 years old today");
        System.out.println("Q15 total number of registered vehicles in the particular parking lot.");
        System.out.println("Selection: ");
        int input = sc.nextInt();
        return input;
    }
    public static void main (String args[])
    {
        int option = menu();
        if (option == 1){


            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
            String user = "root";
            String password = "226896";

            try {

                con = DriverManager.getConnection(url, user, password);
                st = con.createStatement();
                rs = st.executeQuery("select firstname, lastname, phonenumber "
                        + "from staff left outer join hall on staff.staffno=hall.staffno"
                        + " where position = 'Manager'"
                        + " group by phoneNumber;");
                ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                int columnsNumber = rsmd.getColumnCount();



                System.out.println();
                while (rs.next()) {
                    for(int i = 1 ; i <= columnsNumber; i++){

                        System.out.print(rs.getString(i)+" ");

                    }

                    System.out.println();

                }


            } catch (SQLException ex) {

                Logger lgr = Logger.getLogger(Version.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);

            } finally {

                try {

                    if (rs != null) {
                        rs.close();
                    }

                    if (st != null) {
                        st.close();
                    }

                    if (con != null) {
                        con.close();
                    }

                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.WARNING, ex.getMessage(), ex);
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 2){


            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
            String user = "root";
            String password = "226896";

            try {

                con = DriverManager.getConnection(url, user, password);
                st = con.createStatement();
                rs = st.executeQuery("select firstname, lastname, studentinfo.bannernumber, leaseno, placeno, numofsemester, moveindate, moveoutdate"
                        + " from studentinfo join lease on studentinfo.bannernumber=lease.bannernumber"
                        + " group by bannernumber;");
                ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                int colNumber = rsmd.getColumnCount();


                System.out.println();

                while (rs.next()) {


                    for(int i = 1 ; i <= colNumber; i++){

                        System.out.print(rs.getString(i)+" ");

                    }

                    System.out.println();
                }

            } catch (SQLException ex) {

                Logger lgr = Logger.getLogger(Version.class.getName());
                lgr.log(Level.SEVERE, ex.getMessage(), ex);

            } finally {

                try {

                    if (rs != null) {
                        rs.close();
                    }

                    if (st != null) {
                        st.close();
                    }

                    if (con != null) {
                        con.close();
                    }

                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.WARNING, ex.getMessage(), ex);
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 3){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select * FROM Lease WHERE numOfSemester LIKE '3%';");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 4){
            {
                Scanner scanner = new Scanner( System.in );

                System.out.print( "Enter student banner number: " );
                String banner4 = scanner.next();


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select StudentInfo.firstName, StudentInfo.lastName, StudentInfo.bannerNumber, sum(numOfSemester*4*Room.rentRate) as TotalRent"
                            + " from studentinfo join lease on studentinfo.bannernumber=lease.bannernumber"
                            + " JOIN Room on Lease.placeNO=Room.placeNO"
                            + " where studentInfo.bannerNumber='"+banner4+"'"
                            + " group by lease.bannerNumber;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 5){
            {

                Scanner scanner = new Scanner( System.in );

                System.out.print( "Enter date: " );
                String date5 = scanner.next();

                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select StudentInfo.firstName, StudentInfo.lastName"
                            + " from StudentInfo JOIN Lease on StudentInfo.bannernumber=Lease.bannernumber"
                            + " JOIN Invoice on Lease.leaseNO=Invoice.leaseNO"
                            + " where Invoice.date > '"+date5+"';");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 6){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select * FROM inspection"
                            + " WHERE satisfcCondition = 'no';");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();//Move to the next line to print the next row.

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 7){
            {
                Scanner scanner = new Scanner( System.in );

                System.out.print( "Enter Residence Hall Name: " );
                String resHall7 = scanner.next();

                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select StudentInfo.firstName, StudentInfo.lastName, StudentInfo.bannerNumber, Room.placeNO, Room.roomNO"
                            + " from StudentInfo JOIN Lease on StudentInfo.bannerNumber=Lease.bannerNumber"
                            + " JOIN Room on Lease.placeNO = Room.placeNO"
                            + " JOIN Hall on Room.hallNO=Hall.hallNO"
                            + " where Hall.hallName = '"+resHall7+"'"
                            + " group by bannerNumber;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();

                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");
                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 8){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select * FROM StudentInfo"
                            + " WHERE status LIKE 'Waiting%'");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 9){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select StudentLevel.levelName, count(StudentLevel.levelID) as levelCount"
                            + " from StudentInfo JOIN StudentLevel on StudentInfo.levelID=StudentLevel.levelID"
                            + " group by StudentLevel.levelID;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 10){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select StudentInfo.firstName, StudentInfo.lastName, StudentInfo.bannerNumber"
                            + " From StudentInfo left outer join NOK on StudentInfo.bannerNumber=NOK.bannerNumber"
                            + " Where nokID is NULL;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 11){
            {

                Scanner scanner = new Scanner( System.in );

                System.out.print( "Enter student banner number: " );
                String banner11 = scanner.next();

                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select Advisor.firstName, Advisor.lastName, Advisor.phoneNumber"
                            + " from StudentInfo join Advisor on StudentInfo.advisorID=Advisor.advisorID"
                            + " where StudentInfo.bannerNumber = '"+banner11+"';");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.print(rs.getString(i)+" ");

                        }

                        System.out.println();
                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 12){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select round(min(rentRate),2) as MinRent, round(AVG(rentRate),2) as AverageRent, round(max(rentRate),2) as maxRent"
                            + " from Room"
                            + " where hallNO is NOT NULL;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.printf(rs.getString(i)+" ", args);

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 13){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select hall.hallName, COUNT(room.hallNO) as PlaceCount"
                            + " from Room join Hall on room.hallNO = hall.hallNO"
                            + " group by room.hallNO;");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.printf(rs.getString(i)+" ", args);

                        }

                        System.out.println();

                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 14){
            {


                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select staffNO, firstName, lastName, street, city, postCode, TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE()) AS Age"
                            + " FROM Staff"
                            + " WHERE dateOfBirth < (CURDATE()-INTERVAL 60 YEAR);");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();


                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.printf(rs.getString(i)+" ", args);

                        }

                        System.out.println();
                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
            }
            System.out.println();
            option = menu();
        }
        if (option == 15){
            {
                Scanner scanner = new Scanner( System.in );

                System.out.print( "Enter Parking Lot Name: " );
                String lot15 = scanner.next();

                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://127.0.0.1:3306/mydb?verifyServerCertificate=false&useSSL=true";
                String user = "root";
                String password = "226896";

                try {

                    con = DriverManager.getConnection(url, user, password);
                    st = con.createStatement();
                    rs = st.executeQuery("select ParkingLot.lotName, count(StudentInfo.parkingLot) as regVeh"
                            + " from StudentInfo JOIN ParkingLot on StudentInfo.parkingLot = ParkingLot.parkingLot"
                            + " where lotName = '"+lot15+"';");
                    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
                    int columnsNumber = rsmd.getColumnCount();

                    while (rs.next()) {

                        for(int i = 1 ; i <= columnsNumber; i++){

                            System.out.printf(rs.getString(i) +" ", args);
                        }

                        System.out.println();
                    }



                } catch (SQLException ex) {

                    Logger lgr = Logger.getLogger(Version.class.getName());
                    lgr.log(Level.SEVERE, ex.getMessage(), ex);

                } finally {

                    try {

                        if (rs != null) {
                            rs.close();
                        }

                        if (st != null) {
                            st.close();
                        }

                        if (con != null) {
                            con.close();
                        }

                    } catch (SQLException ex) {

                        Logger lgr = Logger.getLogger(Version.class.getName());
                        lgr.log(Level.WARNING, ex.getMessage(), ex);
                    }
                }
                System.out.println();
                option = menu();
            }

        }

    }

}


	
    	