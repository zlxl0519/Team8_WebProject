package test.member.dto;

public class MemberDto {
	private String id;
	private String pwd;
	private String email;
	private String profile;
	private String name;
	private String phone;
	private String regdate;
	
	private int num;
	private String dname;
	private int dage;
	private String breed;
	private String weight;
	private String netural;
	private String gender;
	private String memo;
	
	public MemberDto() {}

	public MemberDto(String id, String pwd, String email, String profile, String name, String phone, String regdate,
			int num, String dname, int dage, String breed, String weight, String netural, String gender, String memo) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.profile = profile;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
		this.num = num;
		this.dname = dname;
		this.dage = dage;
		this.breed = breed;
		this.weight = weight;
		this.netural = netural;
		this.gender = gender;
		this.memo = memo;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public int getDage() {
		return dage;
	}

	public void setDage(int dage) {
		this.dage = dage;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getNetural() {
		return netural;
	}

	public void setNetural(String netural) {
		this.netural = netural;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
}