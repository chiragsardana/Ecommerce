package SBK.DAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import SBK.Model.CartDetails;
import SBK.Model.ItemDetails;

@Repository
public class CartDetailsDAOImpl implements CartDetailsDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
//	Basically it given Cart id not Order Id
	@Override
	public String getOrderId(String emailId) {
		// TODO Auto-generated method stub
				String sql = "SELECT * FROM CartDetails where emailId='" + emailId + "'";
			    return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(CartDetails.class)).getCartId();
	}
	@Override
	public void insertCartId(String cartId, String emailId) {
		String sql = "INSERT INTO CartDetails(emailId ,  cartId)"
				+ "VALUES(?,?)";
		jdbcTemplate.update(sql, new Object[] {
				emailId, cartId
		});
		
	}

}
