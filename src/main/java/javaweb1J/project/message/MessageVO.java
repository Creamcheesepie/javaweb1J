package javaweb1J.project.message;

public class MessageVO {
	private int Idx;
	private int sIdx;
	private int rIdx;
	private String title;
	private String content;
	private String sDate;
	private String rDate;
	private int messageType;
	private int rCheck;
	
	private String sNickName;
	private String sMid;
	private String sEmail;
	public int getIdx() {
		return Idx;
	}
	public void setIdx(int idx) {
		Idx = idx;
	}
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
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
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getMessageType() {
		return messageType;
	}
	public void setMessageType(int messageType) {
		this.messageType = messageType;
	}
	public int getrCheck() {
		return rCheck;
	}
	public void setrCheck(int rCheck) {
		this.rCheck = rCheck;
	}
	public String getsNickName() {
		return sNickName;
	}
	public void setsNickName(String sNickName) {
		this.sNickName = sNickName;
	}
	public String getsMid() {
		return sMid;
	}
	public void setsMid(String sMid) {
		this.sMid = sMid;
	}
	public String getsEmail() {
		return sEmail;
	}
	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}
	@Override
	public String toString() {
		return "MessageVO [Idx=" + Idx + ", sIdx=" + sIdx + ", rIdx=" + rIdx + ", title=" + title + ", content=" + content
				+ ", sDate=" + sDate + ", rDate=" + rDate + ", messageType=" + messageType + ", rCheck=" + rCheck
				+ ", sNickName=" + sNickName + ", sMid=" + sMid + ", sEmail=" + sEmail + "]";
	}

	
	
}
