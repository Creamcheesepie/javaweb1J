package javaweb1J.project.gethering;

public class GetheringVO {
	private int idx;
	
	private int mIdx;
	private String title;
	private String content;
	private String getheringType;
	private String location;
	
	private int totalGetherMember;
	private int getherJoinMember;
	private String gpxFileName;
	private int distance;
	private int getHeight;
	
	private String detailCourse;
	private String getherTime;
	private String wDate;
	private String hostIp;
	
	private String aMid;
	private String aNickName;
	private String aName;
	
	private int joined;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGetheringType() {
		return getheringType;
	}

	public void setGetheringType(String getheringType) {
		this.getheringType = getheringType;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getTotalGetherMember() {
		return totalGetherMember;
	}

	public void setTotalGetherMember(int totalGetherMember) {
		this.totalGetherMember = totalGetherMember;
	}

	public int getGetherJoinMember() {
		return getherJoinMember;
	}

	public void setGetherJoinMember(int getherJoinMember) {
		this.getherJoinMember = getherJoinMember;
	}

	public String getGpxFileName() {
		return gpxFileName;
	}

	public void setGpxFileName(String gpxFileName) {
		this.gpxFileName = gpxFileName;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getGetHeight() {
		return getHeight;
	}

	public void setGetHeight(int getHeight) {
		this.getHeight = getHeight;
	}

	public String getDetailCourse() {
		return detailCourse;
	}

	public void setDetailCourse(String detailCourse) {
		this.detailCourse = detailCourse;
	}

	public String getGetherTime() {
		return getherTime;
	}

	public void setGetherTime(String getherTime) {
		this.getherTime = getherTime;
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

	public String getaName() {
		return aName;
	}

	public void setaName(String aName) {
		this.aName = aName;
	}

	public int getJoined() {
		return joined;
	}

	public void setJoined(int joined) {
		this.joined = joined;
	}

	@Override
	public String toString() {
		return "GetheringVO [idx=" + idx + ", mIdx=" + mIdx + ", title=" + title + ", content=" + content
				+ ", getheringType=" + getheringType + ", location=" + location + ", totalGetherMember=" + totalGetherMember
				+ ", getherJoinMember=" + getherJoinMember + ", gpxFileName=" + gpxFileName + ", distance=" + distance
				+ ", getHeight=" + getHeight + ", detailCourse=" + detailCourse + ", getherTime=" + getherTime + ", wDate="
				+ wDate + ", hostIp=" + hostIp + ", aMid=" + aMid + ", aNickName=" + aNickName + ", aName=" + aName
				+ ", joined=" + joined + "]";
	}
	
	
	
	
	
}
