document.addEventListener('DOMContentLoaded', function () {
    // Đặt ngày hôm nay cho trường startDate
    var today = new Date();
    var day = ("0" + today.getDate()).slice(-2);
    var month = ("0" + (today.getMonth() + 1)).slice(-2);
    var year = today.getFullYear();
    var todayDate = year + "-" + month + "-" + day;
    document.getElementById('startDate').value = todayDate;

    // Kiểm tra ngày kết thúc để đảm bảo không sớm hơn ngày bắt đầu
    document.getElementById('endDate').addEventListener('change', function () {
        var startDate = new Date(document.getElementById('startDate').value);
        var endDate = new Date(this.value);
        if (endDate < startDate) {
            alert("End Date cannot be earlier than Start Date");
            this.value = "";
        }
    });

    // Kiểm tra việc gửi form
    document.getElementById('createContractForm').addEventListener('submit', function (event) {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        if (new Date(endDate) < new Date(startDate)) {
            alert("End Date cannot be earlier than Start Date");
            event.preventDefault();
        }
    });

    // Định dạng đầu vào tiền tệ
    function formatCurrency(input) {
        let value = input.value.replace(/,/g, '');
        if (!isNaN(value) && value >= 0) {
            input.value = Math.floor(value / 50) * 50;
        } else {
            input.value = '';
        }
    }

    document.getElementById('value').addEventListener('input', function () {
        formatCurrency(this);
    });

    document.getElementById('premium').addEventListener('input', function () {
        formatCurrency(this);
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

    // Xử lý gửi form cho phương thức thanh toán
    document.getElementById('createContractForm').addEventListener('submit', function (event) {
        var paymentMethod = document.getElementById('paymentMethod').value;

        if (paymentMethod === "bankTransfer") {
            event.preventDefault();
            window.location.href = "${pageContext.request.contextPath}/bankTransferPage";
        }
    });
});