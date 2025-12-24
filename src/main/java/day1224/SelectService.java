package day1224;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

public class SelectService {
	private static SelectService ss;

	private SelectService() {

	}// SelectService

	public static SelectService getInstance() {
		if (ss == null) {
			ss = new SelectService();
		} // end if
		return ss;
	}// getInstance

	/**
	 * 컬럼 하나에 한 행 조회
	 * 
	 * @param deptno 부서번호
	 * @return 부서명
	 */
	public String scsr(int deptno) {
		String dname = "";
		SelectDAO sDAO = SelectDAO.getInstance();

		try {
			dname = sDAO.scsr(deptno);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch

		return dname;
	}// scsr

	/**
	 * 부서번호를 입력하여 사원명을 검색
	 * 컬럼 하나에 여러 행 조회
	 * @param deptno
	 * @return
	 */
	public List<String> scmr(int deptno) {
		List<String> list = null;
		SelectDAO sDAO = SelectDAO.getInstance();

		try {
			list = sDAO.scmr(deptno);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch

		return list;
	}// scmr
	
	public EmpDTO mcsr(int empno) {
		EmpDTO dDTO = null;
		SelectDAO sDAO = SelectDAO.getInstance();

		try {
			dDTO = sDAO.mcsr(empno);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // catch
		return dDTO;
	}// mcsr

	public List<EmpDTO> mcmr(int deptno) {
		List<EmpDTO> list = null;
		SelectDAO sDAO = SelectDAO.getInstance();

		try {
			list = sDAO.mcmr(deptno);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch

		return list;
	}// mcmr
	
}// class
