package SBK.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import SBK.Model.ItemDetails;

@Repository
public class ItemDetailsDAOImpl implements ItemDetailsDAO {

	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public ItemDetailsDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	@Override
	public void insertItem(ItemDetails item) {
		// TODO Auto-generated method stub
//		 itemId varchar(100) NOT NULL,
//			itemName varchar(100) NOT NULL,
//			careInstruction varchar(100) NOT NULL,
//			fitType varchar(100) NOT NULL,
//			color varchar(100) NOT NULL,
//			fileName1 varchar(100) NOT NULL,
//			fileName2  varchar(100) NOT NULL,
//		price varchar(100) 
		
		String sql = "INSERT INTO ItemDetails(itemId, itemName, careInstruction, fitType, color"
				+ ",fileName1, fileName2, price, category)"
				+ "VALUES(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, new Object[] {
				item.getItemId(),item.getItemName(), item.getCareInstruction(), item.getFitType(),
				item.getColor(), item.getFileName1(), item.getFileName2(), item.getPrice(),item.getCategory()
		});
	}

	@Override
	public ItemDetails getItemDetails(String itemId) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM ItemDetails where itemId='" + itemId + "'";
	    return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(ItemDetails.class));
	}

	@Override
	public List<String> getAllItemNumber() {
		// TODO Auto-generated method stub
		String sql = "SELECT itemId From ItemDetails";
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
	public List<ItemDetails> getAllItemDetails() {
		// TODO Auto-generated method stub
		String sql = "SELECT * From ItemDetails";
		List<ItemDetails> itemIdList = jdbcTemplate.query(sql, new ResultSetExtractor<List<ItemDetails>>(){

			public List<ItemDetails> extractData(ResultSet rs) throws SQLException, DataAccessException {
				 List<ItemDetails> list = new ArrayList<ItemDetails>();
	                while (rs.next())
	                {
	                	
//	           		 itemId varchar(100) NOT NULL,
//	        			itemName varchar(100) NOT NULL,
//	        			careInstruction varchar(100) NOT NULL,
//	        			fitType varchar(100) NOT NULL,
//	        			color varchar(100) NOT NULL,
//	        			fileName1 varchar(100) NOT NULL,
//	        			fileName2  varchar(100) NOT NULL,
//	        		price varchar(100) 
	                	ItemDetails itemDetail = new ItemDetails();
	                	itemDetail.setItemId(rs.getString(1));
	                	itemDetail.setItemName(rs.getString(2));
	                	itemDetail.setCareInstruction(rs.getString(3));
	                	itemDetail.setFitType(rs.getString(4));
	                	itemDetail.setColor(rs.getString(5));
	                	itemDetail.setFileName1(rs.getString(6));
	                	itemDetail.setFileName2(rs.getString(7));
	                	itemDetail.setPrice(rs.getString(8));
	                	itemDetail.setCategory(rs.getString(9));
	                	
	                    list.add(itemDetail);
	                }
	                return list;
			}
        });
		
		return itemIdList;
	}
	

}
