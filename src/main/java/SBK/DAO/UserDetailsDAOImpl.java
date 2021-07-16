package SBK.DAO;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import SBK.Model.ItemDetails;
import SBK.Model.UserDetails;

@Repository
public class UserDetailsDAOImpl implements UserDetailsDAO {

	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public UserDetailsDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void insertDetails(UserDetails user) {
		// TODO Auto-generated method stub
//			private String firstName;
//		private String lastName;
//		private String emailId;
//		private String password;
//		private Boolean verifiedChecker;
//		private String otp;
		String sql = "INSERT INTO UserDetails(firstName, lastName, emailId, password, verifiedChecker"
				+ ",otp)"
				+ "VALUES(?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {
				user.getFirstName(), user.getLastName(), user.getEmailId(), user.getPassword(),
				user.getVerifiedChecker(),user.getOtp()
		});
	}

	@Override
	public UserDetails getUserDetails(String emailId) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM UserDetails where emailId='" + emailId + "'";
	    return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(UserDetails.class));
	}

	@Override
	public String getOtp(String emailId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDetails(UserDetails user) {
		// TODO Auto-generated method stub
		
//		private String firstName;
//	private String lastName;
//	private String emailId;
//	private String password;
//	private Boolean verifiedChecker;
//	private String otp;
		
		String sql = "Update UserDetails set firstName = ?, lastName = ?"
				+ ", password = ?, verifiedChecker = ? "
				+ ", otp = ? WHERE emailId = '"+user.getEmailId()+"'";
		
		jdbcTemplate.update(sql, new Object[] { 
				user.getFirstName(), user.getLastName(), user.getPassword(), user.getVerifiedChecker(),
				user.getOtp()
		});
	}

}
