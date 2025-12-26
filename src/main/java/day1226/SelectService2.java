package day1226;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class SelectService2 {
	private static SelectService2 ss;

	private SelectService2() {

	}// SelectService2

	public static SelectService2 getInstance() {
		if (ss == null) {
			ss = new SelectService2();
		} // end if
		return ss;
	}// getInstance

	/**
	 * 부서번호와 사원번호를 입력받아 사원정보를 검색
	 * @param empDTO
	 * @return
	 */
	public EmpDomain useDomain(EmpDTO empDTO) {
		EmpDomain empDomain = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();

		try {
			empDomain = sDAO.useDomain(empDTO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return empDomain;
	}// useDomain
	
	public List<ZipcodeDomain> useLike(String dong) {
		List<ZipcodeDomain> listZip = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		
		try {
			listZip = sDAO.useLike(dong);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return listZip;
	}// useLike

	public List<EmpDomain> lessThan(int sal) {
		List<EmpDomain> empList = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();

		try {
			empList = sDAO.lessThan(sal);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return empList;
	}// lessThan
	
	public List<EmpDomain> greaterThan(int sal) {
		List<EmpDomain> empList = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		
		try {
			empList = sDAO.greaterThan(sal);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return empList;
	}// greaterThan
	
	public List<EmpAllDomain> subquery() {
		List<EmpAllDomain> empList = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		
		try {
			empList = sDAO.subquery();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return empList;
	}// subquery
	
	public List<EmpAllDomain> union() {
		List<EmpAllDomain> empList = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		
		try {
			empList = sDAO.union();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return empList;
	}// union
	
	public List<CarModelDomain> join() {
		List<CarModelDomain> carList = null;
		SelectDAO2 sDAO = SelectDAO2.getInstance();
		
		try {
			carList = sDAO.join();
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return carList;
	}// join
	
}// class
