package com.ontrip.detailArea.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.ontrip.common.JDBCTemplate.*;

import com.ontrip.detailArea.dao.DetailAreaDao;
import com.ontrip.image.vo.Image;

public class DetailAreaService {

	public String dAreaName(String dareaCode) {
		Connection conn = getConnection();
		
		String dareaName = new DetailAreaDao().dAreaName(dareaCode, conn);
		
		close();
		
		return dareaName;
	}
	
	public ArrayList<Image> selectFilePath(String dareaCode){
		Connection conn = getConnection();
		
		ArrayList<Image> filePath = new DetailAreaDao().selectFilePath(dareaCode, conn);
		
		close();
		
		return filePath;
	}
	
}
