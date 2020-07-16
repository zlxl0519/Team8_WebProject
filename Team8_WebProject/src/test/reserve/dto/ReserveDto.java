package test.reserve.dto;

public class ReserveDto {
	private int num;
	private String member_id;
	private String member_name;
	private String member_phone;
	private int dog_num;
	private String dog_breed;
	private String dog_age;
	private String service;
	private String checkin;
	private String checkout;
	private String etc;
	
	public ReserveDto() {}

	public ReserveDto(int num, String member_id, String member_name, String member_phone, int dog_num, String dog_breed,
			String dog_age, String service, String checkin, String checkout, String etc) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_phone = member_phone;
		this.dog_num = dog_num;
		this.dog_breed = dog_breed;
		this.dog_age = dog_age;
		this.service = service;
		this.checkin = checkin;
		this.checkout = checkout;
		this.etc = etc;
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public int getDog_num() {
		return dog_num;
	}

	public void setDog_num(int dog_num) {
		this.dog_num = dog_num;
	}

	public String getDog_breed() {
		return dog_breed;
	}

	public void setDog_breed(String dog_breed) {
		this.dog_breed = dog_breed;
	}

	public String getDog_age() {
		return dog_age;
	}

	public void setDog_age(String dog_age) {
		this.dog_age = dog_age;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	
}
