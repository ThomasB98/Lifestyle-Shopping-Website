package com.Ecommer.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
        	try {
        		Class.forName("com.mysql.jdbc.Driver");
                connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecom","root","admin");
                System.out.print("connected");
        	}catch (ClassNotFoundException | SQLException e) {
        		e.printStackTrace();
                throw new SQLException("Failed to connect to the database.", e);
        	}
            
        }
        return connection;
	}
}
