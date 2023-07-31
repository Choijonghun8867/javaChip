package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Service
public interface UserService {
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String id);
	int insert(UserVO vo);
	int insertBiz(UserVO vo);
	
	List<UserVO>list(AdminSearchVO AdminSearchVO);	//�����ڿ� ��ü ���� ����Ʈ
	UserVO selectUserOneByuNoByAdmin(int uNo);
}
