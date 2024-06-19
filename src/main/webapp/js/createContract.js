document.addEventListener('DOMContentLoaded', function () {
    // Function to set today's date for startDate input
    var today = new Date();
    var day = ("0" + today.getDate()).slice(-2);
    var month = ("0" + (today.getMonth() + 1)).slice(-2);
    var year = today.getFullYear();
    var todayDate = year + "-" + month + "-" + day;
    document.getElementById('startDate').value = todayDate;

    // Function to validate end date
    document.getElementById('endDate').addEventListener('change', function () {
        var startDate = new Date(document.getElementById('startDate').value);
        var endDate = new Date(this.value);
        if (endDate < startDate) {
            alert("End Date cannot be less than Start Date");
            this.value = "";
        }
    });

    // Function to validate form before submission
    document.getElementById('createContractForm').addEventListener('submit', function (event) {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        if (new Date(endDate) < new Date(startDate)) {
            alert("End Date cannot be less than Start Date");
            event.preventDefault();
        }
    });

    // Function to format currency input
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
});
