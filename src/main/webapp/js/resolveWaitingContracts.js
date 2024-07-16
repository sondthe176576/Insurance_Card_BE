function confirmAction(action) {
    const confirmed = confirm("Are you sure you want to " + action + " this contract?");
    if (confirmed) {
        document.getElementById("actionForm").action = contextPath + "/resolveWaitingContract?action=" + action;
        document.getElementById("actionForm").submit();
    }
}