package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.Motorcycle;
import org.example.insurance_card_be.model.Users;
import org.example.insurance_card_be.model.Customers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO extends DBContext {
    private static final int CUSTOMERS_PER_PAGE = 8;

    // Method to find all customers
    public List<Users> findAll() {
        List<Users> list = new ArrayList<>();
        String sql = "Select * from [Users] where Role = 'Customer'";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to delete a customer by ID
    public void deleteByID(Users users) {
        Connection connection = getConnection();
        String sql = "DELETE FROM [Users] WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, users.getUserID());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to insert a new customer
    public void insert(Users customer) {
        String userInsertSQL = "INSERT INTO [Users] " +
                "([Username], [Password], [Role], [Email], [Mobile], [Province], [District], [Country], " +
                "[First_name], [Last_name], [Full_name], [Birth_date], [Gender]) " +
                "VALUES (?, ?, 'Customer', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String customerInsertSQL = "INSERT INTO [Customers] " +
                "([UserID], [PersonalInfo]) VALUES (?, ?)";

        try (Connection connection = DBContext.getConnection()) {
            connection.setAutoCommit(false); // Start transaction

            // Insert into Users table
            try (PreparedStatement userStmt = connection.prepareStatement(userInsertSQL, Statement.RETURN_GENERATED_KEYS)) {
                userStmt.setString(1, customer.getUsername());
                userStmt.setString(2, customer.getPassword());
                userStmt.setString(3, customer.getEmail());
                userStmt.setString(4, customer.getMobile());
                userStmt.setString(5, customer.getProvince());
                userStmt.setString(6, customer.getDistrict());
                userStmt.setString(7, customer.getCountry());
                userStmt.setString(8, customer.getFirstName());
                userStmt.setString(9, customer.getLastName());
                userStmt.setString(10, customer.getFullName());
                userStmt.setDate(11, new java.sql.Date(customer.getBirthDate().getTime()));
                userStmt.setString(12, customer.getGender());

                int rowsAffected = userStmt.executeUpdate();
                if (rowsAffected > 0) {
                    ResultSet resultSet = userStmt.getGeneratedKeys();
                    if (resultSet.next()) {
                        int userId = resultSet.getInt(1);

                        // Insert into Customers table
                        try (PreparedStatement customerStmt = connection.prepareStatement(customerInsertSQL)) {
                            customerStmt.setInt(1, userId);
                            customerStmt.setString(2, ""); // PersonalInfo can be updated later

                            customerStmt.executeUpdate();
                        }

                        connection.commit(); // Commit transaction
                        System.out.println("Insert successful! Inserted user ID: " + userId);
                    } else {
                        connection.rollback(); // Rollback transaction if user insertion failed
                        System.out.println("Insert failed! No User ID obtained.");
                    }
                } else {
                    connection.rollback(); // Rollback transaction if user insertion failed
                    System.out.println("Insert failed!");
                }
            } catch (SQLException e) {
                connection.rollback(); // Rollback transaction in case of error
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // Method to update a customer
    public void update(Users customer) {
        String sql = "UPDATE [Users] SET " +
                "[Username] = ?, " +
                "[Password] = ?, " +
                "[Role] = ?, " +
                "[Email] = ?, " +
                "[Mobile] = ?, " +
                "[Province] = ?, " +
                "[District] = ?, " +
                "[Country] = ?, " +
                "[First_name] = ?, " +
                "[Last_name] = ?, " +
                "[Full_name] = ?, " +
                "[Birth_date] = ?, " +
                "[Gender] = ? WHERE [UserID] = ?";
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, customer.getUsername());
            statement.setString(2, customer.getPassword());
            statement.setString(3, "Customer");
            statement.setString(4, customer.getEmail());
            statement.setString(5, customer.getMobile());
            statement.setString(6, customer.getProvince());
            statement.setString(7, customer.getDistrict());
            statement.setString(8, customer.getCountry());
            statement.setString(9, customer.getFirstName());
            statement.setString(10, customer.getLastName());
            statement.setString(11, customer.getFullName());
            statement.setDate(12, new java.sql.Date(customer.getBirthDate().getTime()));
            statement.setString(13, customer.getGender());
            statement.setInt(14, customer.getUserID());
            // Debugging statement
            System.out.println("Executing SQL: " + statement.toString());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to find a customer by ID
    public Users findById(int userID) {
        String sql = "SELECT * FROM [Users] WHERE UserID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Mobile"),
                        rs.getString("Province"),
                        rs.getString("District"),
                        rs.getString("Country"),
                        rs.getString("First_name"),
                        rs.getString("Last_name"),
                        rs.getString("Full_name"),
                        rs.getDate("Birth_date"),
                        rs.getString("Gender")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to find customers by username and gender
    public List<Users> findByUsernameAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Full_name] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to find customers by email and gender
    public List<Users> findByEmailAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Email] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to find customers by phone and gender
    public List<Users> findByPhoneAndGender(String keyword, String gender, int page) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND [Mobile] LIKE ? AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, gender);
            st.setString(3, gender);
            st.setInt(4, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(5, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to find all customers with a specific gender
    public List<Users> findAllWithGender(int page, String gender) {
        List<Users> list = new ArrayList<>();
        String sql = "SELECT * FROM [Users] WHERE Role = 'Customer' AND (? = '' OR [Gender] = ?) ORDER BY UserID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, gender);
            st.setString(2, gender);
            st.setInt(3, (page - 1) * CUSTOMERS_PER_PAGE);
            st.setInt(4, CUSTOMERS_PER_PAGE);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setPassword(rs.getString("Password"));
                user.setRole(rs.getString("Role"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setProvince(rs.getString("Province"));
                user.setDistrict(rs.getString("District"));
                user.setCountry(rs.getString("Country"));
                user.setFirstName(rs.getString("First_name"));
                user.setLastName(rs.getString("Last_name"));
                user.setFullName(rs.getString("Full_name"));
                user.setBirthDate(rs.getDate("Birth_date"));
                user.setGender(rs.getString("Gender"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to get total number of customers based on search type and gender
    public int getTotalCustomers(String searchType, String keyword, String gender) {
        String sql = "SELECT COUNT(*) FROM [Users] WHERE Role = 'Customer' AND (? = '' OR [Gender] = ?) ";
        if (searchType.equals("name")) {
            sql += "AND [Full_name] LIKE ?";
        } else if (searchType.equals("email")) {
            sql += "AND [Email] LIKE ?";
        } else if (searchType.equals("phone")) {
            sql += "AND [Mobile] LIKE ?";
        }

        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, gender);
            st.setString(2, gender);
            if (!searchType.isEmpty()) {
                st.setString(3, "%" + keyword + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Method to find customers by ID
    public Customers findCustomerById(int customerId) {
        String sql = "SELECT * FROM [Customers] WHERE CustomerID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Customers(
                        rs.getInt("CustomerID"),
                        findUserById(rs.getInt("UserID")), // Tạo đối tượng Users từ UserID
                        rs.getString("PersonalInfo")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to find user by ID
    public Users findUserById(int userID) {
        String sql = "SELECT * FROM [Users] WHERE UserID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Users(
                        rs.getInt("UserID"),
                        rs.getString("Username"),
                        rs.getString("Password"),
                        rs.getString("Role"),
                        rs.getString("Email"),
                        rs.getString("Mobile"),
                        rs.getString("Province"),
                        rs.getString("District"),
                        rs.getString("Country"),
                        rs.getString("First_name"),
                        rs.getString("Last_name"),
                        rs.getString("Full_name"),
                        rs.getDate("Birth_date"),
                        rs.getString("Gender")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to find motorcycles by customer ID
    public List<Motorcycle> findMotorcyclesByCustomerId(int customerId) {
        List<Motorcycle> motorcycles = new ArrayList<>();
        String sql = "SELECT * FROM [Motorcycles] WHERE CustomerID = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, customerId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Customers customer = findCustomerById(rs.getInt("CustomerID"));
                motorcycles.add(new Motorcycle(
                        rs.getInt("MotorcycleID"),
                        customer,
                        rs.getString("LicensePlate"),
                        rs.getString("Brand"),
                        rs.getString("Model"),
                        rs.getString("FrameNumber"),
                        rs.getString("EngineNumber"),
                        rs.getInt("YearOfManufacture"),
                        rs.getString("Color")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return motorcycles;
    }

    // Ham main de test lay thong tin xe may cua khach hang
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        List<Motorcycle> motorcycles = dao.findMotorcyclesByCustomerId(1);
        for (Motorcycle motorcycle : motorcycles) {
            System.out.println(motorcycle);
        }
    }
}