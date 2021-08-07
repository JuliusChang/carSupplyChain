<%@ page import="com.dongtech.vo.Cart" %>
<%@ page import="com.dongtech.vo.CarOrders" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/list.css">
    <title>维护图书</title>
</head>
<body>
<div class="w">
    <div class="list">
        <div class="list-bd">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                <tr>
                    <th width="18%">编号</th>
                    <th width="5%">价格</th>
                    <th width="10%">操作</th>
                    <%--<th width="10%">数量</th>--%>
                </tr>

                <%
                    List<CarOrders> carOrdersList = (List<CarOrders>) request.getAttribute("list");
                    if (carOrdersList != null) {
                        for (CarOrders carOrders : carOrdersList) {
                            out.write("<tr>");
                            out.write("<td>" + carOrders.getNumber() + "</td>");
                            out.write("<td>" + carOrders.getPrice() + "</td>");
                            out.write("<td>"
                                    +"<a href='/cargoods/queryordersdetails?id="+ carOrders.getId() + "'>订单详情  </a>"
                                    +"<a href='/cargoods/teardowndetails?orderId="+ carOrders.getId() + "'>拆单</a>"
                                    + "</td>");
                            out.write("</tr>");
                        }
                    }
                %>

            </table>
        </div>
    </div>
</div>
</body>
</html>