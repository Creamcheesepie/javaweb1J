package javaweb1J.project.board;

public class BoardRecommendVO {
	private int bIdx;
	private int mIdx;
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getmIdx() {
		return mIdx;
	}
	public void setmIdx(int mIdx) {
		this.mIdx = mIdx;
	}

	@Override
	public String toString() {
		return "BoardRecommendVO [bIdx=" + bIdx + ", mIdx=" + mIdx + "]";
	}
	
}
