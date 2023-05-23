package javaweb1J.project.b_Reple;

public class B_RepleVO {
	private int idx;
	private int mIdx;
	private int bIdx;
	private String reple;
	private String wTime;
	
	private String aMid;
	private String aNickName;
	
	private String bTitle;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getmIdx() {
		return mIdx;
	}

	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getReple() {
		return reple;
	}

	public void setReple(String reple) {
		this.reple = reple;
	}

	public String getwTime() {
		return wTime;
	}

	public void setwTime(String wTime) {
		this.wTime = wTime;
	}

	public String getaMid() {
		return aMid;
	}

	public void setaMid(String aMid) {
		this.aMid = aMid;
	}

	public String getaNickName() {
		return aNickName;
	}

	public void setaNickName(String aNickName) {
		this.aNickName = aNickName;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	@Override
	public String toString() {
		return "B_RepleVO [idx=" + idx + ", mIdx=" + mIdx + ", bIdx=" + bIdx + ", reple=" + reple + ", wTime=" + wTime
				+ ", aMid=" + aMid + ", aNickName=" + aNickName + ", bTitle=" + bTitle + "]";
	}
	
}
