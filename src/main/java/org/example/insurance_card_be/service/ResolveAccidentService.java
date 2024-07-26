package org.example.insurance_card_be.service;

import org.example.insurance_card_be.dao.implement.ResolveAccidentDAO;
import org.example.insurance_card_be.model.Accident;
import org.example.insurance_card_be.model.AccidentHistory;
import org.example.insurance_card_be.util.EmailUtil;

import java.sql.SQLException;
import java.util.Date;

public class ResolveAccidentService {
    private ResolveAccidentDAO resolveAccidentDAO;

    public ResolveAccidentService() {
        resolveAccidentDAO = new ResolveAccidentDAO();
    }

    public Accident getAccidentByID(int accidentID) {
        try {
            return resolveAccidentDAO.getAccidentByID(accidentID);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void updateAccidentStatus(int accidentID, String status) {
        try {
            Accident accident = resolveAccidentDAO.getAccidentByID(accidentID);
            if (accident != null) {
                resolveAccidentDAO.updateAccidentStatus(accidentID, status);

                // Lưu thông tin vào bảng AccidentHistory
                AccidentHistory accidentHistory = new AccidentHistory(
                        accidentID,
                        accident.getCustomerID(),
                        accident.getDescription(),
                        new Date()
                );
                resolveAccidentDAO.saveAccidentHistory(accidentHistory);

                // Tạo nội dung email
                String email = accident.getContract().getCustomer().getUser().getEmail();
                String subject = "Accident Report " + status;
                String content = "Dear " + accident.getCustomer().getUser().getFullName() + ",\n\n" +
                        "Your accident report with ID " + accidentID + " has been " + status.toLowerCase() + ".\n" +
                        "Details:\n" +
                        "Accident Type: " + accident.getAccidentType() + "\n" +
                        "Accident Date: " + accident.getAccidentDate() + "\n" +
                        "Description: " + accident.getDescription() + "\n\n";

                if (status.equalsIgnoreCase("Approved")) {
                    content += "We have received your information and will contact you shortly. Our nearest representative will visit to verify the details related to your vehicle. Based on this verification, we will apply the relevant terms of your registered insurance policy.\n\n";
                } else if (status.equalsIgnoreCase("Rejected")) {
                    content += "We have declined your report. We will contact you shortly to clarify the issue.\n\n";
                }

                content += "Best regards,\n" +
                        "Peace Insurance Company";

                // Send email notification
                EmailUtil.sendEmail(email, subject, content);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}