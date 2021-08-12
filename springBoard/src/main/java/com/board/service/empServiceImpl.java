package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.empDAO;
import com.board.domain.empVO;
@Service
public class empServiceImpl implements empService {
	
	@Inject
	private empDAO dao;
	
	//사원 정보 조회
	@Override
	public List<empVO> list() {
		
		return dao.list();
	}
	
	//사원 등록
	@Override
	public void empCreate(empVO vo) {
		dao.empCreate(vo);
	}
	//사원 목록 상세 내용 불러오기
	@Override
	public empVO empdetail(int empno) {
		return dao.empdetail(empno);
	}
	//사원 수정
	@Override
	public void empUpdate(empVO vo) {
		dao.empUpdate(vo);
	}
	//사원 삭제
	@Override
	public void empDelete(String empno) {
		dao.empDelete(empno);
	}
	//사원 번호로 검색하기
	@Override
	public List<empVO> empIdxSearch(int empno) {
		return dao.empIdxSearch(empno);
	}
	//여러 조건으로 검색하기
	@Override
	public List<empVO> empSearch(Map<String,Object> map) {

		return dao.empSearch(map);
	}

}
