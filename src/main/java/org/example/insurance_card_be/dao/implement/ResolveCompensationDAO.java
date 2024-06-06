package org.example.insurance_card_be.dao.implement;

import org.example.insurance_card_be.dao.DBContext;
import org.example.insurance_card_be.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResolveCompensationDAO {
    // Khai báo connection
    private Connection connection;

    // Khởi tạo connection
    public ResolveCompensationDAO() {
        connection = DBContext.getConnection();
    }

    // Hàm lấy thông tin yêu cầu bồi thường theo ID
    public CompensationRequests getCompensationRequestByID(int requestID) throws SQLException {
        String sql = "SELECT cr.RequestID, cr.CustomerID, cr.ContractID, cr.RequestDate, cr.Status, cr.Description, cr.Amount, " +
                "u.UserID, u.Username, u.Email, u.Mobile, u.Address, u.FullName, u.Gender, " +
                "c.CustomerID, c.PersonalInfo, con.ContractID, con.ContractInfo, con.Status AS ContractStatus, con.StartDate, con.EndDate, " +
                "con.InsuranceType, con.Coverage, con.Premium, cd.Detail, cd.Value, " +
                "m.MotorcycleID, m.LicensePlate, m.Brand, m.Model, m.FrameNumber, m.EngineNumber, m.YearOfManufacture, m.Color " +
                "FROM CompensationRequests cr " +
                "JOIN Contracts con ON cr.ContractID = con.ContractID " +
                "JOIN ContractDetails cd ON con.ContractID = cd.ContractID " +
                "JOIN Customers c ON con.CustomerID = c.CustomerID " +
                "JOIN Users u ON c.UserID = u.UserID " +
                "JOIN Motorcycles m ON c.CustomerID = m.CustomerID " +
                "WHERE cr.RequestID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setEmail(rs.getString("Email"));
                user.setMobile(rs.getString("Mobile"));
                user.setAddress(rs.getString("Address"));
                user.setFullName(rs.getString("FullName"));
                user.setGender(rs.getString("Gender"));

                Motorcycle motorcycle = new Motorcycle();
                motorcycle.setMotorcycleID(rs.getInt("MotorcycleID"));
                motorcycle.setLicensePlate(rs.getString("LicensePlate"));
                motorcycle.setBrand(rs.getString("Brand"));
                motorcycle.setModel(rs.getString("Model"));
                motorcycle.setFrameNumber(rs.getString("FrameNumber"));
                motorcycle.setEngineNumber(rs.getString("EngineNumber"));
                motorcycle.setYearOfManufacture(rs.getInt("YearOfManufacture"));
                motorcycle.setColor(rs.getString("Color"));

                Customers customer = new Customers();
                customer.setCustomerID(rs.getInt("CustomerID"));
                customer.setPersonalInfo(rs.getString("PersonalInfo"));
                customer.setUser(user);

                Contract contract = new Contract();
                contract.setContractID(rs.getInt("ContractID"));
                contract.setContractInfo(rs.getString("ContractInfo"));
                contract.setStatus(rs.getString("ContractStatus"));
                contract.setStartDate(rs.getDate("StartDate"));
                contract.setEndDate(rs.getDate("EndDate"));
                contract.setInsuranceType(rs.getString("InsuranceType"));
                contract.setCoverage(rs.getString("Coverage"));
                contract.setPremium(rs.getDouble("Premium"));

                // Bạn cần đảm bảo rằng bạn có các trường "Detail" và "Value" trong bảng của bạn
                contract.setDetail(rs.getString("Detail"));
                contract.setValue(rs.getDouble("Value"));

                contract.setCustomer(customer);
                contract.setMotorcycle(motorcycle);

                return new CompensationRequests(
                        rs.getInt("RequestID"),
                        rs.getInt("CustomerID"),
                        rs.getInt("ContractID"),
                        rs.getDate("RequestDate"),
                        rs.getString("Status"),
                        rs.getString("Description"),
                        rs.getBigDecimal("Amount"),
                        user.getFullName(),
                        contract // Thêm contract vào cuối
                );
            }
        }
        return null;
    }

    // Hàm cập nhật yêu cầu bồi thường
    public void updateCompensationRequest(CompensationRequests request) throws SQLException {
        String sql = "UPDATE CompensationRequests SET Status = ? WHERE RequestID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, request.getStatus());
            ps.setInt(2, request.getRequestID());
            ps.executeUpdate();
        }
    }

    // Ham main de test lay thoong tin yeu cau boi thuong theo ID
    public static void main(String[] args) {
        ResolveCompensationDAO resolveCompensationDAO = new ResolveCompensationDAO();
        try {
            CompensationRequests request = resolveCompensationDAO.getCompensationRequestByID(1);
            if (request != null) {
                System.out.println(request.getRequestID());
                System.out.println(request.getCustomerID());
                System.out.println(request.getContractID());
                System.out.println(request.getRequestDate());
                System.out.println(request.getStatus());
                System.out.println(request.getDescription());
                System.out.println(request.getAmount());
                System.out.println(request.getCustomerName());
                System.out.println(request.getContract().getContractID());
                System.out.println(request.getContract().getContractInfo());
                System.out.println(request.getContract().getStatus());
                System.out.println(request.getContract().getStartDate());
                System.out.println(request.getContract().getEndDate());
                System.out.println(request.getContract().getInsuranceType());
                System.out.println(request.getContract().getCoverage());
                System.out.println(request.getContract().getPremium());
                System.out.println(request.getContract().getDetail());
                System.out.println(request.getContract().getValue());
                System.out.println(request.getContract().getCustomer().getCustomerID());
                System.out.println(request.getContract().getCustomer().getPersonalInfo());
                System.out.println(request.getContract().getCustomer().getUser().getUserID());
                System.out.println(request.getContract().getCustomer().getUser().getUsername());
                System.out.println(request.getContract().getCustomer().getUser().getEmail());
                System.out.println(request.getContract().getCustomer().getUser().getMobile());
                System.out.println(request.getContract().getCustomer().getUser().getAddress());
                System.out.println(request.getContract().getCustomer().getUser().getFullName());
                System.out.println(request.getContract().getCustomer().getUser().getGender());
                System.out.println(request.getContract().getMotorcycle().getMotorcycleID());
                System.out.println(request.getContract().getMotorcycle().getLicensePlate());
                System.out.println(request.getContract().getMotorcycle().getBrand());
                System.out.println(request.getContract().getMotorcycle().getModel());
                System.out.println(request.getContract().getMotorcycle().getFrameNumber());
                System.out.println(request.getContract().getMotorcycle().getEngineNumber());
                System.out.println(request.getContract().getMotorcycle().getYearOfManufacture());
                System.out.println(request.getContract().getMotorcycle().getColor());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}