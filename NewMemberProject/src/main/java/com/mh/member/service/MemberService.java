package com.mh.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mh.member.mapper.MemberMapper;
import com.mh.member.vo.MemberVO;

@Service
public class MemberService {

	@Autowired	// component-scan ... servlet-context.xml
	MemberMapper memberMapper;	// setConnection 처럼 new를 해줘야됨... -> @Autowired
	
	public List<MemberVO> memberList() {
		return memberMapper.memberList();	// mybatis를 호출하는...
	}
	
	public int memberRegister(MemberVO member) {
		return memberMapper.memberRegister(member);
	}
	
	public MemberVO memberGetOne(int mno) {
		return memberMapper.memberGetOne(mno);
	}
	
	public int memberUpdate(MemberVO member) {
		return memberMapper.memberUpdate(member);
	}
	
	public int memberDelete(int mno) {
		return memberMapper.memberDelete(mno);
	}
	
	public MemberVO authLogin(MemberVO member) {
		return memberMapper.authLogin(member);
	}
	
	public MemberVO checkEmail(String email) {
		return memberMapper.checkEmail(email);
	}
	
	// 강사님
	public MemberVO checkIdDup(String email) {
		return memberMapper.checkIdDup(email);
	}
	
}
