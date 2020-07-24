package test.notice.dto;

public class NoticeDto {
	private int num;
	private String title;
	private String content;
	private int viewCount;
	private String regdate;
	
	public NoticeDto() {}

	public NoticeDto(int num, String title, String content, int viewCount, String regdate) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
}//NoticeDto
