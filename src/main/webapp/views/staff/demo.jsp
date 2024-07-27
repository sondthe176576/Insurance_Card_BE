<%--
  Created by IntelliJ IDEA.
  User: 09114
  Date: 6/8/2024
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, org.example.insurance_card_be.dao.implement.UserDAO, org.example.insurance_card_be.model.Users" %>
<%
    Users loggedInUser = (Users) session.getAttribute("user");
    if (loggedInUser == null) {
        request.getRequestDispatcher("/views/homepage/home.jsp").forward(request, response);
        return;
    }

    UserDAO userDAO = new UserDAO();
    Users userFromDB = userDAO.getUserByID(loggedInUser.getUserID());
    if (userFromDB == null) {
        return;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<script src="https://esgoo.net/scripts/jquery.js"></script>
<style type="text/css">
    .css_select_div{ text-align: center;}
    .css_select{ display: inline-table; width: 25%; padding: 5px; margin: 5px 2%; border: solid 1px #686868; border-radius: 5px;}
</style>
<body>
<script>
    $(document).ready(function () {
        // Fetch provinces
        $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
            if (data_tinh.error == 0) {
                $.each(data_tinh.data, function (key_tinh, val_tinh) {
                    $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                });
                $("#tinh").change(function (e) {
                    var idtinh = $(this).val();
                    $("#hidden_tinh").val($("#tinh option:selected").text());
                    // Fetch districts
                    $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                        if (data_quan.error == 0) {
                            $("#quan").html('<option value="0">Quận Huyện</option>');
                            $("#phuong").html('<option value="0">Phường Xã</option>');
                            $.each(data_quan.data, function (key_quan, val_quan) {
                                $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                            });
                            // Fetch wards
                            $("#quan").change(function (e) {
                                var idquan = $(this).val();
                                $("#hidden_quan").val($("#quan option:selected").text());
                                $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                    if (data_phuong.error == 0) {
                                        $("#phuong").html('<option value="0">Phường Xã</option>');
                                        $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                            $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                        });
                                        $("#phuong").change(function (e) {
                                            $("#hidden_phuong").val($("#phuong option:selected").text());
                                        });
                                    }
                                });
                            });
                        }
                    });
                });
            }
        });
    });
</script>

<div class="css_select_div">
    <select class="css_select" id="tinh" name="tinh" title="Chọn Tỉnh Thành">
        <option value="0">Tỉnh Thành</option>
    </select>
    <select class="css_select" id="quan" name="quan" title="Chọn Quận Huyện">
        <option value="0">Quận Huyện</option>
    </select>
    <select class="css_select" id="phuong" name="phuong" title="Chọn Phường Xã">
        <option value="0">Phường Xã</option>
    </select>
</div>
<form action="#" >
    <div>
<input type="hidden" name="tinh" id="hidden_tinh" >
<input type="hidden" name="quan" id="hidden_quan">
<input type="hidden" name="phuong" id="hidden_phuong">
    <input type="submit" value="submit">
    </div>
</form>
</body>

</html>
