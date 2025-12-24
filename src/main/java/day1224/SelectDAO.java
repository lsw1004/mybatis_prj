package day1224;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisHandler;

public class SelectDAO {
	private static SelectDAO sDAO;
	
	private SelectDAO() {
		
	}// SelectDAO
	
	public static SelectDAO getInstance() {
		if(sDAO == null) {
			sDAO = new SelectDAO();
		}// end if
		return sDAO;
	}// getInstance
	
	/**
	 * 컬럼 하나에 한 행 조회
	 * @param deptno 부서번호
	 * @return 부서명
	 */
	public String scsr(int deptno) throws PersistenceException{
		String dname = "";
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		dname = ss.selectOne("day1224.scsr",deptno);
		if(ss != null) {ss.close();}// end if
		return dname;
	}// scsr
	
	/**
	 * 부서번호를 입력받아서 해당 부서에 속한 모든 사원명을 검색
	 * 컬럼 하나에 여러 행 조회
	 * @param deptno 부서번호
	 * @return
	 */
	public List<String> scmr(int deptno) throws PersistenceException{
		List<String> list= null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		list = ss.selectList("day1224.scmr",deptno);
		if(ss != null) {ss.close();}// end if
		return list;
	}// scmr
	
	/**
	 * 사원번호에 대한 사원 정보 조회
	 * @param empno
	 * @return
	 * @throws PersistenceException
	 */
	public EmpDTO mcsr(int empno) throws PersistenceException{
		EmpDTO eDTO= null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		eDTO = ss.selectOne("day1224.mcsr",empno);
		if(ss != null) {ss.close();}// end if
		return eDTO;
	}// mcsr
	
	public List<EmpDTO> mcmr(int deptno) throws PersistenceException{
		List<EmpDTO> list= null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		list = ss.selectList("day1224.mcmr",deptno);
		if(ss != null) {ss.close();}// end if
		return list;
	}// mcmr
	
	
	
}// class
