package net.macaronics.web.dto;

import java.sql.Timestamp;

public class ProductVO {
	private int pseq; //product_seq 시퀀스 객체로 자동 일련번호 부여
	private String name;  //상품명 
	private String kind ; //char(1) 상품 종류 
	private int price1 ;  // number DEFAULT 0,			-- 원가
	private int price2;  // number default 0,			-- 판매가
	private int price3; // number DEFAULT 0,			-- 판매가-원가
	private String content;  //VARCHAR2(3000) null,		-- 상품 내용
	private String image; // VARCHAR2(150) DEFAULT 'default.jpg',	
	private String useyn; 	// char(1) DEFAULT 'y', 			-- 상품 사용유무 체크 y: 사용가능 n: 사용불가능
	private String bestyn; 	// char(1) DEFAULT 'n',			-- 베스트상품인지 여부 체크 y:베스트 상품 n:베스트 상품 아님
	private Timestamp indate ; //date default sysdate	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice1() {
		return price1;
	}
	public void setPrice1(int price1) {
		this.price1 = price1;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public int getPrice3() {
		return price3;
	}
	public void setPrice3(int price3) {
		this.price3 = price3;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getBestyn() {
		return bestyn;
	}
	public void setBestyn(String bestyn) {
		this.bestyn = bestyn;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "ProductVO [pseq=" + pseq + ", name=" + name + ", kind=" + kind + ", price1=" + price1 + ", price2="
				+ price2 + ", price3=" + price3 + ", content=" + content + ", image=" + image + ", useyn=" + useyn
				+ ", bestyn=" + bestyn + ", indate=" + indate + "]";
	}
	
	
}
