package com.rm.model;

public class RoomVO {
	//����
	private String title;
	
	//��ȣ
	private String roompw;
	
	//�����
	private int member_cnt;
	
	//���� �̹���
	private String main_img;
	
	//����
	private String explanation;
	
	//���ڵ�
	private int roomcode;
	
	//������
	private int type;
	
	//���� ���̵�
	private String id;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRoompw() {
		return roompw;
	}

	public void setRoompw(String roompw) {
		this.roompw = roompw;
	}

	public int getMember_cnt() {
		return member_cnt;
	}

	public void setMember_cnt(int member_cnt) {
		this.member_cnt = member_cnt;
	}

	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}


	

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "RoomVO [title=" + title + ", roompw=" + roompw + ", member_cnt=" + member_cnt + ", main_img=" + main_img
				+ ", explanation=" + explanation + ", roomcode=" + roomcode + ", type=" + type + ", id=" + id + "]";
	}

		

}
