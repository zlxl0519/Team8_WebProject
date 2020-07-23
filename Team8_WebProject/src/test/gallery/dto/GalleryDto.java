package test.gallery.dto;

public class GalleryDto {
	private int num;
	private String id;
	private String caption;
	private String content;
	private String imagePath;
	private int hit;
	private String regdate;
	
	public GalleryDto() {}

	public GalleryDto(int num, String id, String caption, String content, String imagePath, int hit, String regdate) {
		super();
		this.num = num;
		this.id = id;
		this.caption = caption;
		this.content = content;
		this.imagePath = imagePath;
		this.hit = hit;
		this.regdate = regdate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	
}
