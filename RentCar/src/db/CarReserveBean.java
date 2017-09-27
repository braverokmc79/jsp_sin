package db;

import java.sql.Date;

public class CarReserveBean {

	private int no;
	private int qty;
	private int dday;//대여기간
	private String rday;//대여일
	private int userin;
	private int usewifi;
	private int usenavi;
	private int userseat;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getRday() {
		return rday;
	}
	public void setRday(String rday) {
		this.rday = rday;
	}
	public int getUserin() {
		return userin;
	}
	public void setUserin(int userin) {
		this.userin = userin;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getUserseat() {
		return userseat;
	}
	public void setUserseat(int userseat) {
		this.userseat = userseat;
	}
	
	@Override
	public String toString() {
		return "CarReserveBean [no=" + no + ", qty=" + qty + ", dday=" + dday + ", rday=" + rday + ", userin=" + userin
				+ ", usewifi=" + usewifi + ", usenavi=" + usenavi + ", userseat=" + userseat + "]";
	}
	
	
	
	
}



