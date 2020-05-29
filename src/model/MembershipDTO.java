package model;


public class MembershipDTO {
	
	private String name;
	private String user_id;
	private String user_pw;
	private String user_pw2;
	private String tel;
	private String mobile;
	private String email;
	private String address;
	
	//기본생성자
		public MembershipDTO() {}
		
		public MembershipDTO(String name, String user_id, String user_pw,String user_pw2,
				String tel, String mobile, String email, String address) {
			super();
			this.user_id = user_id;
			this.user_pw = user_pw;
			this.name = name;
			this.user_pw2= user_pw2;
			this.address = address;
			this.tel = tel;
			this.mobile = mobile;
			this.email = email;
			this.address = address;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getUser_id() {
			return user_id;
		}

		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}

		public String getUser_pw() {
			return user_pw;
		}

		public void setUser_pw(String user_pw) {
			this.user_pw = user_pw;
		}

		public String getUser_pw2() {
			return user_pw2;
		}

		public void setUser_pw2(String user_pw2) {
			this.user_pw2 = user_pw2;
		}

		public String getTel() {
			return tel;
		}

		public void setTel(String tel) {
			this.tel = tel;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

	
}
