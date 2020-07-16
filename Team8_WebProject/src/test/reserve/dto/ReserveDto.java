package test.reserve.dto;

public class ReserveDto {
	private int num;
	private String member_id;
	private int dog_num;
	private String service;
	private String checkin;
	private String checkout;
	private String etc;
	
	public ReserveDto() {}

	public ReserveDto(int num, String member_id, int dog_num, String service, String checkin, String checkout,
			String etc) {
		super();
		this.num = num;
		this.member_id = member_id;
		this.dog_num = dog_num;
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

	public int getDog_num() {
		return dog_num;
	}

	public void setDog_num(int dog_num) {
		this.dog_num = dog_num;
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
