package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.insurance_card_be.model.Contract;
import org.example.insurance_card_be.model.Notifications;
import org.example.insurance_card_be.model.Users;
import org.example.insurance_card_be.service.ListAllContractService;
import org.example.insurance_card_be.service.NotificationService;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ListAllContractController", urlPatterns = "/listAllContractForCustomer")
public class ListAllContractController extends HttpServlet {
    private ListAllContractService listAllContractService;
    private NotificationService notificationService;

    @Override
    public void init() throws ServletException {
        this.listAllContractService = new ListAllContractService();
        this.notificationService = new NotificationService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
        }

        Users user = (Users) session.getAttribute("user");
        if (!"staff".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("homepageforcustomer");
            return;
        }

        try {
            int page = 1;
            int limit = 10;
            if (req.getParameter("page") != null) {
                page = Integer.parseInt(req.getParameter("page"));
            }
            String status = req.getParameter("status");
            String customerName = req.getParameter("customerName");
            String startDate = req.getParameter("startDate");
            String insuranceType = req.getParameter("insuranceType");

            List<Contract> allContracts = listAllContractService.getAllContracts(status, customerName, startDate, insuranceType, page, limit);
            int totalContracts = listAllContractService.getTotalContracts(status, customerName, startDate, insuranceType);
            int totalPages = (int) Math.ceil((double) totalContracts / limit);

            req.setAttribute("allContracts", allContracts);
            req.setAttribute("totalContracts", totalContracts);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("currentPage", page);
            req.setAttribute("status", status);
            req.setAttribute("customerName", customerName);
            req.setAttribute("startDate", startDate);
            req.setAttribute("insuranceType", insuranceType);

            // Lấy danh sách thông báo chưa đọc
            List<Notifications> unreadNotifications = notificationService.getUnreadNotificationsForUser(user.getUserID());
            req.setAttribute("unreadNotifications", unreadNotifications);

            // Đọc thông báo thành công từ session
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                req.setAttribute("successMessage", successMessage);
                session.removeAttribute("successMessage");
            }

            req.getRequestDispatcher("/views/contract/listAllContractForCustomer.jsp").forward(req, resp);
        } catch (Exception e) {
            Logger logger = Logger.getLogger(ListAllContractController.class.getName());
            logger.log(Level.SEVERE, "Failed to load all contracts!", e);
            req.setAttribute("message", "Failed to load all contracts: " + e.getMessage());
            req.setAttribute("status", false);
            req.getRequestDispatcher("/views/contract/listAllContractForCustomer.jsp").forward(req, resp);
        }
    }
}