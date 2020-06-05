package model;

public class MyfileDTO {
	
	private String idx; //일련번호
	private String ofile; //원본파일명
	private String sfile; //서버에 저장된 파일명
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
}
