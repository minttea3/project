package com.board.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.empVO;
@Repository
public class empDAOImpl implements empDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="com.board.mappers.board";
	
	//사원 정보 모두 보기
	@Override
	public List<empVO> list() {
		
		return sql.selectList(namespace+".list");
	}
	
	//사원 등록
	@Override
	public void empCreate(empVO vo) {
		sql.insert(namespace+".create",vo);
	}
	//상세 보기
	@Override
	public empVO empdetail(int empno) {
		return sql.selectOne(namespace+".detail",empno);
	}
	//수정하기
	@Override
	public void empUpdate(empVO vo) {
		sql.update(namespace+".update",vo);
	}
	//삭제하기
	@Override
	public void empDelete(String empno) {
		sql.delete(namespace+".delete",empno);
	}
	//사원 번호로 검색하기
	@Override
	public List<empVO> empIdxSearch(int empno){
		return sql.selectList(namespace+".empIdxSearch",empno);
	}
	//여러조건으로 검색하기
	@Override
	public List<empVO> empSearch(Map<String,Object> map) {
		return sql.selectList(namespace+".empSearch",map);
	}
	
}
