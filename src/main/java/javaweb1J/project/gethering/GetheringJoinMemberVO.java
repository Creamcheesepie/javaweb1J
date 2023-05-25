package javaweb1J.project.gethering;

public class GetheringJoinMemberVO {
	private int idx;
	private int gIdx;
	private int mIdx;
	private String jDate;
	
	private String jName;
	private String jNickName;
	private int jMIdx;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getgIdx() {
		return gIdx;
	}
	public void setgIdx(int gIdx) {
		this.gIdx = gIdx;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}
	public String getjDate() {
		return jDate;
	}
	public void setjDate(String jDate) {
		this.jDate = jDate;
	}
	public String getjName() {
		return jName;
	}
	public void setjName(String jName) {
		this.jName = jName;
	}
	public String getjNickName() {
		return jNickName;
	}
	public void setjNickName(String jNickName) {
		this.jNickName = jNickName;
	}
	public int getjMIdx() {
		return jMIdx;
	}
	public void setjMIdx(int jMIdx) {
		this.jMIdx = jMIdx;
	}
	@Override
	public String toString() {
		return "GetheringJoinMemberVO [idx=" + idx + ", gIdx=" + gIdx + ", mIdx=" + mIdx + ", jDate=" + jDate + ", jName="
				+ jName + ", jNickName=" + jNickName + ", jMIdx=" + jMIdx + "]";
	}
	
	
	
	
}
