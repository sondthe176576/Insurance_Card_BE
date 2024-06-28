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
});
