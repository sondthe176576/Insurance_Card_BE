document.addEventListener('DOMContentLoaded', function () {
    // Đặt ngày hôm nay cho trường startDate
    var today = new Date();
    var day = ("0" + today.getDate()).slice(-2);
    var month = ("0" + (today.getMonth() + 1)).slice(-2);
    var year = today.getFullYear();
    var todayDate = year + "-" + month + "-" + day;
    document.getElementById('startDate').value = todayDate;

    // Tính toán ngày kết thúc hợp đồng dựa trên số năm hợp đồng
    document.getElementById('contractYears').addEventListener('input', function () {
        updateEndDate();
        updateValue();
    });

    function updateEndDate() {
        var startDate = new Date(document.getElementById('startDate').value);
        var years = parseInt(document.getElementById('contractYears').value);
        if (!isNaN(years) && years > 0) {
            startDate.setFullYear(startDate.getFullYear() + years);
            document.getElementById('endDate').value = startDate.toISOString().split('T')[0];
        } else {
            document.getElementById('endDate').value = '';
        }
    }

    function updateValue() {
        var years = parseInt(document.getElementById('contractYears').value);
        var premium = parseFloat(document.getElementById('premium').value);
        if (!isNaN(years) && !isNaN(premium) && years > 0 && premium > 0) {
            document.getElementById('value').value = years * premium;
        } else {
            document.getElementById('value').value = '';
        }
    }

    // Kiểm tra ngày kết thúc để đảm bảo không sớm hơn ngày bắt đầu
    document.getElementById('endDate').addEventListener('change', function () {
        var startDate = new Date(document.getElementById('startDate').value);
        var endDate = new Date(this.value);
        if (endDate < startDate) {
            alert("End Date cannot be earlier than Start Date");
            this.value = '';
        }
    });

    // Ngăn chặn gửi form nếu ngày kết thúc sớm hơn ngày bắt đầu
    document.getElementById('createContractForm').addEventListener('submit', function (event) {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        if (new Date(endDate) < new Date(startDate)) {
            alert("End Date cannot be earlier than Start Date");
            event.preventDefault();
        }
    });

    // Ẩn thông báo sau 5 giây
    setTimeout(function () {
        var notification = document.getElementById('notification');
        if (notification) {
            notification.style.opacity = '0';
            setTimeout(function () {
                notification.style.display = 'none';
            }, 300);
        }
    }, 5000);

    // Chuyển đổi chi tiết thanh toán dựa trên phương thức đã chọn
    document.getElementById('paymentMethod').addEventListener('change', function () {
        togglePaymentDetails();
    });

    function togglePaymentDetails() {
        var paymentMethod = document.getElementById('paymentMethod').value;
        var cashPaymentDetails = document.getElementById('cashPaymentDetails');
        var bankTransferDetails = document.getElementById('bankTransferDetails');

        if (paymentMethod === "cash") {
            cashPaymentDetails.style.display = "block";
            bankTransferDetails.style.display = "none";
        } else if (paymentMethod === "bankTransfer") {
            cashPaymentDetails.style.display = "none";
            bankTransferDetails.style.display = "block";
        } else {
            cashPaymentDetails.style.display = "none";
            bankTransferDetails.style.display = "none";
        }
    }

    // Hiển thị hộp thoại xác nhận khi chọn loại bảo hiểm
    document.getElementById('insuranceType').addEventListener('change', function () {
        const selectedType = this.value;
        if (selectedType) {
            const modal = document.createElement('div');
            modal.classList.add('modal', 'fade');
            modal.tabIndex = -1;
            modal.innerHTML = `
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Confirm Insurance Type</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to select ${selectedType} insurance?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" id="confirmInsuranceType">Yes</button>
                        </div>
                    </div>
                </div>
            `;
            document.body.appendChild(modal);
            const bsModal = new bootstrap.Modal(modal);
            bsModal.show();

            document.getElementById('confirmInsuranceType').addEventListener('click', function () {
                updateInsuranceDetails(selectedType);
                bsModal.hide();
            });

            modal.addEventListener('hidden.bs.modal', function () {
                document.body.removeChild(modal);
            });
        }
    });

    function updateInsuranceDetails(type) {
        let premium, coverage, detail, contractInfo;
        switch (type) {
            case 'Basic':
                premium = 100;
                coverage = 'Basic coverage details...';
                detail = 'This is a basic insurance package.';
                contractInfo = 'Basic Motorcycle Insurance';
                break;
            case 'Comprehensive':
                premium = 150;
                coverage = 'Comprehensive coverage details...';
                detail = 'This is a comprehensive insurance package.';
                contractInfo = 'Comprehensive Motorcycle Insurance';
                break;
            case 'Premium':
                premium = 250;
                coverage = 'Premium coverage details...';
                detail = 'This is a premium insurance package.';
                contractInfo = 'Premium Motorcycle Insurance';
                break;
        }
        document.getElementById('premium').value = premium;
        document.getElementById('coverage').value = coverage;
        document.getElementById('detail').value = detail;
        document.getElementById('contractInfo').value = contractInfo;
        updateValue();
        makeFieldsEditable();
    }

    function makeFieldsEditable() {
        document.getElementById('contractYears').readOnly = false;
        document.getElementById('insuranceType').disabled = false;
    }

    // Bỏ thuộc tính chỉ đọc và vô hiệu hóa khi có thay đổi
    document.getElementById('contractYears').addEventListener('focus', function () {
        makeFieldsEditable();
    });

    document.getElementById('insuranceType').addEventListener('focus', function () {
        makeFieldsEditable();
    });
});