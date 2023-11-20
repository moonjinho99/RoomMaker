package com.rm.model;

public class RoomVO {

	
	private int roomcode;
	
	private String id;

	public int getRoomcode() {
		return roomcode;
	}

	public void setRoomcode(int roomcode) {
		this.roomcode = roomcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "RoomVO [roomcode=" + roomcode + ", id=" + id + "]";
	}
	
	
	
	
}
