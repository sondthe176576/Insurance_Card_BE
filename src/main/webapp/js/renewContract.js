document.addEventListener('DOMContentLoaded', function () {
    // Function to hide notification after 5 seconds
    setTimeout(function () {
        var notification = document.getElementById('notification');
        if (notification) {
            notification.style.opacity = '0';
            setTimeout(function () {
                notification.style.display = 'none';
            }, 300);
        }
    }, 5000);

    // Function to format currency input
    function formatCurrency(input) {
        let value = input.value.replace(/,/g, '');
        if (!isNaN(value) && value >= 0) {
            input.value = Math.floor(value / 50) * 50;
        } else {
            input.value = '';
        }
    }

    document.getElementById('newPremium').addEventListener('input', function () {
        formatCurrency(this);
    });

    // Function to set today's date for renewalDate input
    var today = new Date();
    var day = ("0" + today.getDate()).slice(-2);
    var month = ("0" + (today.getMonth() + 1)).slice(-2);
    var year = today.getFullYear();
    var todayDate = year + "-" + month + "-" + day;
    document.getElementById('renewalDate').value = todayDate;

    // Function to validate renewalDate is not less than endDate and startDate
    document.getElementById('renewalDate').addEventListener('change', function () {
        var startDate = new Date(document.getElementById('startDate').value);
        var endDate = new Date(document.getElementById('endDate').value);
        var renewalDate = new Date(this.value);
        if (renewalDate < startDate || renewalDate < endDate) {
            alert("Renewal Date cannot be less than Start Date or End Date");
            this.value = "";
        }
    });
});