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
public class CartItemDetailsDAOImpl implements CartItemDetailsDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public List<String> getItemList(String cartId) {
		// TODO Auto-generated method stub
		String sql = "SELECT itemId From CartItemDetails Where cartId ='"+cartId+"'";
		List<String> itemIdList = jdbcTemplate.query(sql, new ResultSetExtractor<List<String>>(){

			public List<String> extractData(ResultSet rs) throws SQLException, DataAccessException {
				 List<String> list = new ArrayList<String>();
	                while (rs.next())
	                {
	                    list.add(rs.getString(1));
	                }
	                return list;
			}
        });
		
		return itemIdList;
	}
	@Override
	public void insertItemId(String cartId, ItemDetails itemDetails) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO CartItemDetails(cartId, itemId)"
				+ "VALUES(?,?)";
		jdbcTemplate.update(sql, new Object[] {
				cartId, itemDetails.getItemId()
		});
	}
	@Override
	public void deleteItemsId(String cartId) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM CartItemDetails where cartId=?";
		jdbcTemplate.update(sql, new Object[]{cartId});
	}
	@Override
	public void deleteParticularItemsId(String itemId, String cartId) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM CartItemDetails where cartId=? AND itemId = ?";
		jdbcTemplate.update(sql, new Object[]{cartId, itemId});
	}

}
