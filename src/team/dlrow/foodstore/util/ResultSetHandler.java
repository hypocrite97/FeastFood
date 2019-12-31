package team.dlrow.foodstore.util;

import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * @author dlrow
 * @date 2018年12月24日
 * 
 * 结果处理器接口
 */
public interface ResultSetHandler {
	public Object doHandler(ResultSet rs)throws SQLException;
}