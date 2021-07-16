package SBK.DAO;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import SBK.Model.UserDetails;

@Repository
public class AccountVerifiedDAOImpl implements AccountVerifiedDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public AccountVerifiedDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void insert(UserDetails user) {
		// TODO Auto-generated method stub
		
//		`username` varchar(50) NOT NULL,
//		  `password` varchar(50) NOT NULL,
//		  `enabled` tinyint(1) NOT NULL,
		String sql = "INSERT INTO users(username, password, enabled)"
				+ "VALUES(?,?,?)";
		
		jdbcTemplate.update(sql, new Object[] {
				user.getEmailId(), "{noop}"+user.getPassword(), 1
		});
		
//		 `username` varchar(50) NOT NULL,
//		  `authority` varchar(50) NOT NULL,
		sql = "INSERT INTO authorities(username, authority)"
				+ "VALUES(?,?)";
		
		jdbcTemplate.update(sql, new Object[] {
				user.getEmailId(), "ROLE_USER"
		});
	}
	@Override
	public void update(UserDetails user) {
		// TODO Auto-generated method stub
//		`username` varchar(50) NOT NULL,
//		  `password` varchar(50) NOT NULL,
		String sql = "Update users set password = ? WHERE username = '"+user.getEmailId()+"'";
		
		jdbcTemplate.update(sql, new Object[] { 
				"{noop}"+user.getPassword()
		});
	}

}
