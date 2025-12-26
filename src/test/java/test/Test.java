package test;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.junit.jupiter.api.DisplayName;

import day1224.EmpDTO;
import day1224.SelectDAO;
import day1224.SelectService;
import day1226.EmpDomain;
import day1226.SelectDAO2;

public class Test {

	@org.junit.Test
	@DisplayName("select 테스트")
	public void test() {
//		SelectService ss = SelectService.getInstance();
//		assertNotNull(ss.scsr(10));
//		assertEquals(ss.scsr(10), "ACCOUNTINGg");
//		assertNotNull(ss.scmr(10));
		
//		SelectDAO sDAO = SelectDAO.getInstance();
//		EmpDTO eDTO = sDAO.mcsr(7788);
//		List<EmpDTO> list = sDAO.mcmr(10);
//		System.out.println(list);
//		assertNotNull(list);
//		assertEquals(list.size(), 3);
		
//		day1226.EmpDTO eDTO = new day1226.EmpDTO();
//		eDTO.setEmpno(7521);
//		eDTO.setDeptno(30);
		
		SelectDAO2 sDAO = SelectDAO2.getInstance();
//		EmpDomain ed = sDAO.useDomain(eDTO);
//		assertNotNull(ed);
		try {
//		assertNotNull(sDAO.useLike("대치동"));
//		assertNotNull(sDAO.greaterThan(3000));
//		assertNotNull(sDAO.subquery());
//		assertNotNull(sDAO.union());
		assertNotNull(sDAO.join());
		}catch(PersistenceException pe) {
			pe.printStackTrace();
		}
	}// test

}
