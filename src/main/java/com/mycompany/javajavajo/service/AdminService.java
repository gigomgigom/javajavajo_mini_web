package com.mycompany.javajavajo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.javajavajo.dao.MemberDao;
import com.mycompany.javajavajo.dao.ProductDao;
import com.mycompany.javajavajo.dto.Member;
import com.mycompany.javajavajo.dto.Pager;
import com.mycompany.javajavajo.dto.Product;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminService {
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private MemberDao memberDao;
	
	//심영조-admin-main페이지-재고부족상품들 가져오기
	public List<Product> getOutOfStock() {
		return productDao.selectLackStock();
	}
	//심영조-admin-memberList페이지-조건에 맞는 member들의 총 갯수를 가져옴
	public int getTotalRows() {
		int totalRows = memberDao.countSelectedRows();
		return totalRows;
	}
	//심영조-admin-memberList페이지-Pager 조건에 맞는 데이터(List<Member>)를 받아와라
	public List<Member> getMemberList(Pager pager) {
		List<Member> memberList = memberDao.selectByPage(pager);
		return memberList;
	}
	//심영조-admin-memberDetail페이지- 회원번호를 주었을때 회원의 정보를 가져와라
	public Member getMemberByMemno(int memno) {
		Member member = memberDao.selectByMemno(memno);
		return member;
	}
	//문제 발생 메소드
	public int editMemberInfo(Member member) {
		log.info(member.getMememail());
		int updatedRowNo = memberDao.updateMemberInfo(member);
		return updatedRowNo;
	}
	
}
