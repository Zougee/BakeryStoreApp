package breadstore2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/breadstore_db";
    private static final String USER = "root";  // ganti jika pakai user lain
    private static final String PASSWORD = "";  // isi password MySQL kamu jika ada

    private static Connection conn;

    // Method untuk mendapatkan koneksi database
    public static Connection getConnection() {
        if (conn == null) {
            try {
                conn = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Koneksi database berhasil!");
            } catch (SQLException e) {
                System.out.println("Koneksi database gagal: " + e.getMessage());
            }
        }
        return conn;
    }
}
