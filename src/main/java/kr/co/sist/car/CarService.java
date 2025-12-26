package kr.co.sist.car;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import day1226.CarModelDomain;

public class CarService {
	private static CarService cs;

	private CarService() {

	}// CarService

	public static CarService getInstance() {
		if (cs == null) {
			cs = new CarService();
		} // end if
		return cs;
	}// getInstance
	
	public List<CarModelDomain> searchMaker(String country){
		List<CarModelDomain> makerList = null;
		CarDAO cDAO = CarDAO.getInstance();
		try {
			makerList = cDAO.selectMaker(country);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch
		
		return makerList;
	}// searchMaker
	
	public List<CarModelDomain> searchModel(String maker){
		List<CarModelDomain> modelList = null;
		CarDAO cDAO = CarDAO.getInstance();
		try {
			modelList = cDAO.selectModel(maker);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch
		
		return modelList;
	}// searchModel
	
	public List<CarModelDomain> searchCarDetail(String model){
		List<CarModelDomain> modelList = null;
		CarDAO cDAO = CarDAO.getInstance();
		try {
			modelList = cDAO.selectCarDetail(model);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		}// end catch
		
		return modelList;
	}// searchCarDetail
}// class
