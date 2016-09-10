package com.ebanking.bean;

public class Transaction {

	private String Tid;
	private String Tby;
	private String Tto;
	private String Amount;
	private String ByBal;
    private String Tdate;
    public String getTid() {
		return Tid;
	}
	public void setTid(String tid) {
		Tid = tid;
	}
	public String getTby() {
		return Tby;
	}
	public void setTby(String tby) {
		Tby = tby;
	}
	public String getTto() {
		return Tto;
	}
	public void setTto(String tto) {
		Tto = tto;
	}
	public String getAmount() {
		return Amount;
	}
	public void setAmount(String amount) {
		Amount = amount;
	}
	public String getByBal() {
		return ByBal;
	}
	public void setByBal(String byBal) {
		ByBal = byBal;
	}
	public String getTdate() {
		return Tdate;
	}
	public void setTdate(String tdate) {
		Tdate = tdate;
	}
	public String getTtime() {
		return Ttime;
	}
	public void setTtime(String ttime) {
		Ttime = ttime;
	}
	private String Ttime;


}
