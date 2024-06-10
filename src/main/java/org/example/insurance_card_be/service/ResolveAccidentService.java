package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveAccidentDAO;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;

public class ResolveAccidentService {
    // Khai bao resolveAccidentDAO
    private ResolveAccidentDAO resolveAccidentDAO;

    // Khoi tao resolveAccidentDAO
    public ResolveAccidentService() {
        resolveAccidentDAO = new ResolveAccidentDAO();
    }

    // Ham lay thong tin tai nan theo ID
    public Accident getAccidentByID(int accidentID) {
        try {
            return resolveAccidentDAO.getAccidentByID(accidentID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    // Ham cap nhat trang thai cua tai nan
    public void updateAccidentStatus(int accidentID, String status) {
        try {
            Accident accident = resolveAccidentDAO.getAccidentByID(accidentID);
            if (accident != null) {
                resolveAccidentDAO.updateAccidentStatus(accidentID, status);

                // Tạo nội dung email
                String email = accident.getContract().getCustomer().getUser().getEmail();
                String subject = "Accident Report " + status;
                String content = "Dear " + accident.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your accident report with ID " + accidentID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Accident Type: " + accident.getAccidentType() + "\n" +
                        "Accident Date: " + accident.getAccidentDate() + "\n" +
                        "Description: " + accident.getDescription() + "\n\n" +
                        "Best regards,\n" +
                        "Your Insurance Company";

                // Gửi email thông báo
                EmailUtil.sendEmail(email, subject, content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
