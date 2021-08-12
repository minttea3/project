package com.board.dao;

import java.util.List;
import java.util.Map;

import com.board.domain.empVO;


public interface empDAO {
	public List<empVO> list(); // 사원 정보 모두 조회
	public void empCreate(empVO vo);// 사원 등록
	public empVO empdetail(int empno); // 상세보기
	public void empUpdate(empVO vo);//수정하기
	public void empDelete(String empno);//삭제하기
	public List<empVO> empIdxSearch(int empno);//사원 번호로 검색하기
	public List<empVO> empSearch(Map<String,Object> map);//여러조건으로 검색하기
	
	
}
