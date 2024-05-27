package org.example.insurance_card_be.controller.contract;

import jakarta.servlet.annotation.WebServlet;

import org.example.insurance_card_be.service.ViewContractService;

@WebServlet(name = "ViewContractController", urlPatterns = "/viewContract")
public class ViewContractController {
    private ViewContractService viewContractService;

    public ViewContractController() {
        this.viewContractService = new ViewContractService();
    }

}
