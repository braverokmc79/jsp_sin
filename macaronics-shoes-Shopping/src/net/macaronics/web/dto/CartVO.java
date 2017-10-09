package net.macaronics.web.dto;

import java.sql.Timestamp;

/*
 * 
 * create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result 
from tbl_cart o, tbl_member m, tbl_product p 
where o.id = m.id and o.pseq = p.pseq
and result='1';
*/

public class CartVO {
    
	private int odseq; //주문 상세 번호
	private int oseq;  //주문번호
	private int cseq;  //장바구니 번호
	private String id;  //회원아이디
	private int pseq;  //상품번호
	private String mname;  //회원이름
	private String pname; //상품이름
	private int quantity; //수량
	private int price2; //가격
	private String image;
	private Timestamp indate;
	public int getOdseq() {
		return odseq;
	}
	public void setOdseq(int odseq) {
		this.odseq = odseq;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPrice2() {
		return price2;
	}
	public void setPrice2(int price2) {
		this.price2 = price2;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	
	@Override
	public String toString() {
		return "CartVO [odseq=" + odseq + ", oseq=" + oseq + ", cseq=" + cseq + ", id=" + id + ", pseq=" + pseq
				+ ", mname=" + mname + ", pname=" + pname + ", quantity=" + quantity + ", price2=" + price2 + ", image="
				+ image + ", indate=" + indate + "]";
	}
	
	

	
	
}
