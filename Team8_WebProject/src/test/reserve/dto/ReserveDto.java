package test.reserve.dto;

public class ReserveDto {
	private int num;
	private String service;
	private String checkin;
	private String checkout;
	private String etc;
	
	public ReserveDto() {}

	public ReserveDto(int num, String service, String checkin, String checkout, String etc) {
		super();
		this.num = num;
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
	};
	
	
}
