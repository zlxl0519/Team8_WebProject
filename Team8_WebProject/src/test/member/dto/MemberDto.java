package test.member.dto;

public class MemberDto {
	//사람용
	private String id;
	private String pwd;
	private String newPwd;//수정할 새 비밀번호
	private String email;
	private String profile;
	private String newProfile;//수정할 새 프로필사진
	private String name;
	private String phone;
	private String regdate;
	
	//강아지용
	private int num; 
	private String member_id;
	private String dname;
	private int dage;
	private String breed;
	private String weight;
	private String neutral;
	private String gender;
	private String memo;
	
	//페이징 처리
	private int startRowNum;
	private int endRowNum;
	
	public MemberDto() {}

	public MemberDto(String id, String pwd, String newPwd, String email, String profile, String newProfile, String name,
			String phone, String regdate, int num, String member_id, String dname, int dage, String breed,
			String weight, String neutral, String gender, String memo, int startRowNum, int endRowNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.newPwd = newPwd;
		this.email = email;
		this.profile = profile;
		this.newProfile = newProfile;
		this.name = name;
		this.phone = phone;
		this.regdate = regdate;
		this.num = num;
		this.member_id = member_id;
		this.dname = dname;
		this.dage = dage;
		this.breed = breed;
		this.weight = weight;
		this.neutral = neutral;
		this.gender = gender;
		this.memo = memo;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
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

	public String getNewProfile() {
		return newProfile;
	}

	public void setNewProfile(String newProfile) {
		this.newProfile = newProfile;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getNeutral() {
		return neutral;
	}

	public void setNeutral(String neutral) {
		this.neutral = neutral;
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

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

}