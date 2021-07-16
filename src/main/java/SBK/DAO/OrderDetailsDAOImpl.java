package SBK.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import SBK.Model.ItemDetails;
import SBK.Model.OrderDetails;


@Repository
public class OrderDetailsDAOImpl implements OrderDetailsDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void placeOrder(OrderDetails orderDetails) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO OrderDetails(orderId, emailId, addressId,status "
				+ ")"
				+ "VALUES(?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {
				orderDetails.getOrderId(), orderDetails.getEmailId(), orderDetails.getAddressId(),orderDetails.getStatus()
		});
	}

	@Override
	public OrderDetails getOrderDetail(String orderId) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String sql = "SELECT * FROM OrderDetails where orderId='" + orderId + "'";
			    return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(OrderDetails.class));
	}

	@Override
	public List<String> getOrderList(String emailId) {
		// TODO Auto-generated method stub
		String sql = "SELECT orderId From OrderDetails Where emailId='"+emailId+"'";
		List<String> orderIdList = jdbcTemplate.query(sql, new ResultSetExtractor<List<String>>(){

			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
				 List<String> list = new ArrayList<String>();
	                while (rs.next())
	                {
	                    list.add(rs.getString(1));
	                }
	                return list;
			}
        });
		
		return orderIdList;
	}

	@Override
	public List<OrderDetails> getAllOrderList() {
		// TODO Auto-generated method stub
		String sql = "SELECT * From OrderDetails";
		List<OrderDetails> orderAllOrderList = jdbcTemplate.query(sql, new ResultSetExtractor<List<OrderDetails>>(){

			public List<OrderDetails> extractData(ResultSet rs) throws SQLException, DataAccessException {
				 List<OrderDetails> list = new ArrayList<OrderDetails>();
	                while (rs.next())
	                {
//	                	 orderId varchar(100) not null ,
//	                	  emailId varchar(100) not null ,
//	                	  addressId varchar(100) not null 
	                	OrderDetails orderDetails = new OrderDetails();
	                	orderDetails.setOrderId(rs.getString(1));
	                	orderDetails.setEmailId(rs.getString(2));
	                	orderDetails.setAddressId(rs.getString(3));
	                	orderDetails.setStatus(rs.getString(4));
	                    list.add(orderDetails);
	                }
	                return list;
			}
        });
		
		return orderAllOrderList;
	}

	@Override
	public void changeStatus(String status, String orderId) {
		// TODO Auto-generated method stub
		
//		
//		  orderId varchar(100) not null ,
//		  emailId varchar(100) not null ,
//		  addressId varchar(100) not null ,
//		  status
//		OrderDetails
		String sql = "Update OrderDetails set status = ? WHERE orderId =?";
		
		jdbcTemplate.update(sql, new Object[] { status ,orderId
				});
		
	}

}
