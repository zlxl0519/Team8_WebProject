package dto;

public class FaqDto {
	private int num;
	private String qst;
	private String ans;
	
	public FaqDto() {}

	public FaqDto(int num, String qst, String ans) {
		super();
		this.num = num;
		this.qst = qst;
		this.ans = ans;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getQst() {
		return qst;
	}

	public void setQst(String qst) {
		this.qst = qst;
	}

	public String getAns() {
		return ans;
	}

	public void setAns(String ans) {
		this.ans = ans;
	}
	
	
	
}
