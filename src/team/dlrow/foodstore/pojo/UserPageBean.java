package team.dlrow.foodstore.pojo;

import java.util.ArrayList;
import java.util.List;

import team.dlrow.foodstore.dao.UserDAO;
import team.dlrow.foodstore.pojo.User;

/**
 * @author dlrow
 * @date 2018年12月30日
 * 
 * 分页类
 * 提供分页功能
 */
public class UserPageBean {
	private int pageSize = 4;
	private int pageNo = 1;
	private int totalPages;
	private List<User> pageData = new ArrayList<User>();
	private boolean hasNextPage;
	private boolean hasPreviousPage;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalPages() {
		UserDAO dao = new UserDAO();
		int recordCount = dao.getRecordCount();
		return (recordCount + pageSize - 1) / pageSize;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public List<User> getPageData() {
		UserDAO dao = new UserDAO();
		List<User> list = dao.getCatePageList(pageNo, pageSize);
		return list;
	}

	public void setPageData(List<User> pageData) {
		this.pageData = pageData;
	}

	public boolean isHasNextPage() {
		return (this.getPageNo() < this.getTotalPages());
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public boolean isHasPreviousPage() {
		return (this.getPageNo() > 1);
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}
}
