package kr.co.sist.car;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day1226.CarModelDomain;
import kr.co.sist.dao.MyBatisHandler;

public class CarDAO {
	private static CarDAO cDAO;

	private CarDAO() {

	}// CarDAO

	public static CarDAO getInstance() {
		if (cDAO == null) {
			cDAO = new CarDAO();
		} // end if
		return cDAO;
	}// getInstance

	public List<CarModelDomain> selectMaker(String country) throws PersistenceException {
		List<CarModelDomain> makerList = null;

		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);

		makerList = ss.selectList("car.selectMaker", country);

		return makerList;
	}// selectMaker
	
	public List<CarModelDomain> selectModel(String maker) throws PersistenceException {
		List<CarModelDomain> modelList = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		modelList = ss.selectList("car.selectModel", maker);
		
		return modelList;
	}// selectModel
	
	public List<CarModelDomain> selectCarDetail(String model) throws PersistenceException {
		List<CarModelDomain> modelList = null;
		
		SqlSession ss = MyBatisHandler.getInstance().getMyBatisHandler(false);
		
		modelList = ss.selectList("car.selectCarDetail", model);
		
		return modelList;
	}// selectCarDetail
}// class
