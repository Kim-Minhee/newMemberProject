package com.mh.member.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mh.member.vo.MemberVO;

@Repository
public interface MemberMapper {

	public List<MemberVO> memberList();
	
	public int memberRegister(MemberVO member);
	
	public MemberVO memberGetOne(int mno);
	
	public int memberUpdate(MemberVO member);
	
	public int memberDelete(int mno);
	
	public MemberVO memberLogin(MemberVO member);
	
	public MemberVO authLogin(MemberVO member);
	
	public MemberVO checkEmail(String email);
	
	// 강사님
	public MemberVO checkIdDup(String email);
	
}
