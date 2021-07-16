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

import SBK.Model.AddressDetails;
import SBK.Model.ItemDetails;
import SBK.Model.AddressDetails;

@Repository
public class AddressDetailsDAOImpl implements AddressDetailsDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Override
	public void insertAddress(AddressDetails addressDetails) {
		// TODO Auto-generated method stub
		
//		emailId varchar(100) NOT NULL,
//	    name varchar(100) NOT NULL,
//	    pinCode varchar(100) NOT NULL ,
//	    locality varchar(100) NOT NULL ,
//	    address varchar(100) NOT NULL ,
//	    city varchar(100) NOT NULL ,
//	    state varchar(100) NOT NULL ,
//	    landmark varchar(100),
//	    alternateNumber varchar(100),
//	    mobileNumber varchar(100) NOT NULL,
//	    addressId varchar(100) NOT NULL,
		
		String sql = "INSERT INTO AddressDetails(emailId, name, pinCode, locality, address"
				+ ",city, state, landmark, alternateNumber, mobileNumber, addressId)"
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {
				addressDetails.getEmailId(), addressDetails.getName(), addressDetails.getPinCode(),
				addressDetails.getLocality(), addressDetails.getAddress(), addressDetails.getCity(),
				addressDetails.getState(), addressDetails.getLandmark(), addressDetails.getAlternateNumber(),
				addressDetails.getMobileNumber(), addressDetails.getAddressId()
		});
	}

	@Override
	public void updateAddress(AddressDetails addressDetails) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AddressDetails> getAddress(String emailId) {
		String sql = "SELECT * From AddressDetails Where emailId = '"+emailId+"'";
		
		List<AddressDetails> addressList = jdbcTemplate.query(sql, new ResultSetExtractor<List<AddressDetails>>(){
			//
						public List<AddressDetails> extractData(ResultSet rs) throws SQLException, DataAccessException {
							 List<AddressDetails> list = new ArrayList<AddressDetails>();
				                while (rs.next())
				                {
//				                	emailId varchar(100) NOT NULL,
//				                    name varchar(100) NOT NULL,
//				                    pinCode varchar(100) NOT NULL ,
//				                    locality varchar(100) NOT NULL ,
//				                    address varchar(100) NOT NULL ,
//				                    city varchar(100) NOT NULL ,
//				                    state varchar(100) NOT NULL ,
//				                    landmark varchar(100),
//				                    alternateNumber varchar(100),
//				                	mobileNumber
//				                	Address ID
				                	AddressDetails addressDetail = new AddressDetails();
				                	addressDetail.setEmailId(rs.getString(1));
				                	addressDetail.setName(rs.getString(2));
				                	addressDetail.setPinCode(rs.getString(3));
				                	addressDetail.setLocality(rs.getString(4));
				                	addressDetail.setAddress(rs.getString(5));
				                	addressDetail.setCity(rs.getString(6));
				                	addressDetail.setState(rs.getString(7));
				                	addressDetail.setLandmark(rs.getString(8));
				                	addressDetail.setAlternateNumber(rs.getString(9));
				                	addressDetail.setMobileNumber(rs.getString(10));
				                	addressDetail.setAddressId(rs.getString(11));
				                	
				                    list.add(addressDetail);
				                }
				                return list;
						}
			        });
		return addressList;
		
		
		
	}

	@Override
	public AddressDetails getParticularAddress(String addressId) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM AddressDetails where addressId='" + addressId + "'";
	    return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(AddressDetails.class));
	}

}
