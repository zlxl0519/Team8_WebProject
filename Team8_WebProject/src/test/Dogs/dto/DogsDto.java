package test.Dogs.dto;

public class DogsDto {
	private String id;
	private String dname;
	private int dage;
	private String breed;
	private String weight;
	private String neutral;
	private String gender;
	private String memo;
	
	public DogsDto() {}

	public DogsDto(String id, String dname, int dage, String breed, String weight, String neutral, String gender,
			String memo) {
		super();
		this.id = id;
		this.dname = dname;
		this.dage = dage;
		this.breed = breed;
		this.weight = weight;
		this.neutral = neutral;
		this.gender = gender;
		this.memo = memo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
}
