package javaweb1J.project.board;

public class BoardVO {
	private int idx;
	private int mIdx;
	private String title;
	private String article;
	private String wDate;
	private String hostIp;
	private String category;
	private int viewCnt;
	private int recommend;
	
	private String aMid;
	private String aNickName;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getHostIp() {
		return hostIp;
	}
	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
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
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", mIdx=" + mIdx + ", title=" + title + ", article=" + article + ", wDate=" + wDate
				+ ", hostIp=" + hostIp + ", category=" + category + ", viewCnt=" + viewCnt + ", recommend=" + recommend
				+ ", aMid=" + aMid + ", aNickName=" + aNickName + "]";
	}
	
	
}
