<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="main.java.com.BidsyJava.*"%>
<%@ page import="main.java.com.BidsyJava.CustomLogger"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="user_landing.css">
<title> List of bids</title>
</head>
<body>
	<div class="user-dashboard">
		<div class="form">
			<table>
				<tr>
					<th>Bid ID:</th>
					<th>User ID:</th>
					<th>Bidding Price:</th>
					<th>Time of bid:</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<%
				ApplicationDB ap = new ApplicationDB();
				Connection con = ap.getConnection();
				try {

					Statement stmt = con.createStatement();
					String sql = "SELECT bid_id, bidding_price, bid_time, user_id FROM bids;";

					ResultSet rs = stmt.executeQuery(sql);
					// loop through the result set and create options for the select element
					while (rs.next()) {
						Timestamp bid_time = rs.getTimestamp("bid_time");
						int bid_id = rs.getInt("bid_id");
						String user_id = rs.getString("user_id");
						int bidding_price = rs.getInt("bidding_price");

						
						
						StringBuilder str = new StringBuilder();

						str.append("<tr><td>").append(bid_id).append("</td>")
						.append("<td>").append(user_id).append("</td>")
						.append("<td>").append(String.valueOf(bidding_price))
						.append("</td>").append("<td>")
						.append(String.valueOf(bid_time)).append("</td></tr>");

						out.print(str);
					}
				

			} catch (SQLException e) {
			e.printStackTrace();
			} finally {
			ap.closeConnection(con);
			}
				%>

			</table>
		</div>
	</div>


</body>
</html>