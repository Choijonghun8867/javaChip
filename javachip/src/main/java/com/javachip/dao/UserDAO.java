package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.UserMapper";
	
	public UserVO selectMemberByLogin(UserVO vo) {
		return sqlSession.selectOne(namespace+".selectUserByLogin", vo);
	}
	
	public int selectCntById(String id) {
		return sqlSession.selectOne(namespace+".selectCntById", id);
	}
	
	public int insert(UserVO vo) {
		return sqlSession.insert(namespace+".insert", vo);
	}
	
	public int insertBiz(UserVO vo) {
		return sqlSession.insert(namespace+".insertBiz", vo);
	}
	
	public List<UserVO> list(AdminSearchVO AdminSearchVO)	//�����ڿ� ��ü ȸ�� ���
	{
		return sqlSession.selectList(namespace+".selectUserByAdmin", AdminSearchVO);
	}
	
	public UserVO selectUserOneByuNoByAdmin(int uNo)		//�����ڿ� ���� ȸ�� ����
	{
		return sqlSession.selectOne(namespace+".selectUserOneByuNoByAdmin", uNo);
	}
}
