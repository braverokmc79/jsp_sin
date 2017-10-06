package net.macaronics.web.dto;

import java.sql.Timestamp;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import com.sun.istack.internal.NotNull;

public class MemberVO {
	@NotEmpty @Size(min=4, max=12)
	private String id ; 
	@NotEmpty @Size(min=6, max=20)
	private String pwd ;   
	@NotEmpty
	private String pwdCheck;
	
	@NotEmpty @Size(min=2, max=12)
	private String name ; 
	
	@NotEmpty @Email
	private String email ;
	
	@NotNull @NotEmpty
	private String zip_num;
	
	private String address ; 
	@NotNull
	private String address1;

	private String address2;
	
	private String phone ;   
	private String useyn ; 
	
	@NotNull
	private String ip  ;     
	private Timestamp indate ;
	
	
	public boolean isPassCheck(){
		if(this.pwd.equals(this.pwdCheck)){
			return false;
		}
		//패스워드가 일치하지 않으면 true
		return true;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPwdCheck() {
		return pwdCheck;
	}
	public void setPwdCheck(String pwdCheck) {
		this.pwdCheck = pwdCheck;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZip_num() {
		return zip_num;
	}
	public void setZip_num(String zip_num) {
		this.zip_num = zip_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", pwdCheck=" + pwdCheck + ", name=" + name + ", email=" + email
				+ ", zip_num=" + zip_num + ", address=" + address + ", address1=" + address1 + ", address2=" + address2
				+ ", phone=" + phone + ", useyn=" + useyn + ", ip=" + ip + ", indate=" + indate + "]";
	}
	
	
	

	
}
