package javaweb1J.project.todayAttendMent;

public class TodayAttendMentVO {
		private int idx;
		private int mIdx;
		private String title;
		private String article;
		private String wDate;
		private String hostIp;
		
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
			return "TodayAttendMentVO [idx=" + idx + ", mIdx=" + mIdx + ", title=" + title + ", article=" + article
					+ ", wDate=" + wDate + ", hostIp=" + hostIp + ", aMid=" + aMid + ", aNickName=" + aNickName + "]";
		}
	
		
}
