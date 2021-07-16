package SBK.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import SBK.Model.ItemDetails;

@Repository
public class OrderItemListDAOImpl implements OrderItemListDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<String> getItemList(String orderId) {
		// TODO Auto-generated method stub
		String sql = "SELECT itemId From OrderItems WHERE orderId = '"+orderId+"'";
		List<String> orderItemsIdList = jdbcTemplate.query(sql, new ResultSetExtractor<List<String>>(){

			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
				 List<String> list = new ArrayList<String>();
	                while (rs.next())
	                {
	                    list.add(rs.getString(1));
	                }
	                return list;
			}
        });
		
		return orderItemsIdList;
	}
	@Override
	public void insertItems(String orderId, ItemDetails itemDetails) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO OrderItems(orderId, ItemId)"
				+ "VALUES(?,?)";
		jdbcTemplate.update(sql, new Object[] {
				orderId, itemDetails.getItemId()
		});
	}

}
