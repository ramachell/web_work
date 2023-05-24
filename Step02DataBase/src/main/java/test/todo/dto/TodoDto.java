package test.todo.dto;

public class TodoDto {
	private int num;
	private String work;
	private String etc;

	public TodoDto() {

	}

	public TodoDto(String work, String etc) {
		this.work = work;
		this.etc = etc;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWork() {
		return work;
	}

	public void setWork(String work) {
		this.work = work;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

}