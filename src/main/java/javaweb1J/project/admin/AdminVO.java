package javaweb1J.project.admin;

public class AdminVO {
		//각종 운영자용 정보 가져오기 위한 VO
	//회원 정보
	private int l0Cnt;
	private int l1Cnt;
	private int l2Cnt;
	private int l3Cnt;
	private int l4Cnt;
	private int l5Cnt; //각 등급별 회원수
	
	private int newMemberCnt;//오늘 신규회원 수
	
	private int mCnt; //총 회원수
	
	private String nmNickName;
	private String nmMid;
	
	//한마디 정보
	private int tamTCnt;
	private int tamTodaycCnt;
	private int tamToWeekCnt;
	private String twnNickName;
	private String twnMid;
	
	//게시글 정보
	private int tbCnt;
	private int nbDCnt;
	private int nbWCnt;
	private String nbwnNickName;
	private String nbwnMid;
	
	//모임글 정보.
	private int tgCnt;
	private int mgCnt;
	private int wgCnt;
	private int nmgCnt;
	private int nwgCnt;
	
	public int getL0Cnt() {
		return l0Cnt;
	}
	public void setL0Cnt(int l0Cnt) {
		this.l0Cnt = l0Cnt;
	}
	public int getL1Cnt() {
		return l1Cnt;
	}
	public void setL1Cnt(int l1Cnt) {
		this.l1Cnt = l1Cnt;
	}
	public int getL2Cnt() {
		return l2Cnt;
	}
	public void setL2Cnt(int l2Cnt) {
		this.l2Cnt = l2Cnt;
	}
	public int getL3Cnt() {
		return l3Cnt;
	}
	public void setL3Cnt(int l3Cnt) {
		this.l3Cnt = l3Cnt;
	}
	public int getL4Cnt() {
		return l4Cnt;
	}
	public void setL4Cnt(int l4Cnt) {
		this.l4Cnt = l4Cnt;
	}
	public int getL5Cnt() {
		return l5Cnt;
	}
	public void setL5Cnt(int l5Cnt) {
		this.l5Cnt = l5Cnt;
	}
	public int getNewMemberCnt() {
		return newMemberCnt;
	}
	public void setNewMemberCnt(int newMemberCnt) {
		this.newMemberCnt = newMemberCnt;
	}
	public int getmCnt() {
		return mCnt;
	}
	public void setmCnt(int mCnt) {
		this.mCnt = mCnt;
	}
	public String getNmNickName() {
		return nmNickName;
	}
	public void setNmNickName(String nmNickName) {
		this.nmNickName = nmNickName;
	}
	public String getNmMid() {
		return nmMid;
	}
	public void setNmMid(String nmMid) {
		this.nmMid = nmMid;
	}
	public int getTamTCnt() {
		return tamTCnt;
	}
	public void setTamTCnt(int tamTCnt) {
		this.tamTCnt = tamTCnt;
	}
	public int getTamTodaycCnt() {
		return tamTodaycCnt;
	}
	public void setTamTodaycCnt(int tamTodaycCnt) {
		this.tamTodaycCnt = tamTodaycCnt;
	}
	public int getTamToWeekCnt() {
		return tamToWeekCnt;
	}
	public void setTamToWeekCnt(int tamToWeekCnt) {
		this.tamToWeekCnt = tamToWeekCnt;
	}
	public String getTwnNickName() {
		return twnNickName;
	}
	public void setTwnNickName(String twnNickName) {
		this.twnNickName = twnNickName;
	}
	public String getTwnMid() {
		return twnMid;
	}
	public void setTwnMid(String twnMid) {
		this.twnMid = twnMid;
	}
	public int getTbCnt() {
		return tbCnt;
	}
	public void setTbCnt(int tbCnt) {
		this.tbCnt = tbCnt;
	}
	public int getNbDCnt() {
		return nbDCnt;
	}
	public void setNbDCnt(int nbDCnt) {
		this.nbDCnt = nbDCnt;
	}
	public int getNbWCnt() {
		return nbWCnt;
	}
	public void setNbWCnt(int nbWCnt) {
		this.nbWCnt = nbWCnt;
	}
	public String getNbwnNickName() {
		return nbwnNickName;
	}
	public void setNbwnNickName(String nbwnNickName) {
		this.nbwnNickName = nbwnNickName;
	}
	public String getNbwnMid() {
		return nbwnMid;
	}
	public void setNbwnMid(String nbwnMid) {
		this.nbwnMid = nbwnMid;
	}
	public int getTgCnt() {
		return tgCnt;
	}
	public void setTgCnt(int tgCnt) {
		this.tgCnt = tgCnt;
	}
	public int getMgCnt() {
		return mgCnt;
	}
	public void setMgCnt(int mgCnt) {
		this.mgCnt = mgCnt;
	}
	public int getWgCnt() {
		return wgCnt;
	}
	public void setWgCnt(int wgCnt) {
		this.wgCnt = wgCnt;
	}
	public int getNmgCnt() {
		return nmgCnt;
	}
	public void setNmgCnt(int nmgCnt) {
		this.nmgCnt = nmgCnt;
	}
	public int getNwgCnt() {
		return nwgCnt;
	}
	public void setNwgCnt(int nwgCnt) {
		this.nwgCnt = nwgCnt;
	}
	@Override
	public String toString() {
		return "AdminVO [l0Cnt=" + l0Cnt + ", l1Cnt=" + l1Cnt + ", l2Cnt=" + l2Cnt + ", l3Cnt=" + l3Cnt + ", l4Cnt=" + l4Cnt
				+ ", l5Cnt=" + l5Cnt + ", newMemberCnt=" + newMemberCnt + ", mCnt=" + mCnt + ", nmNickName=" + nmNickName
				+ ", nmMid=" + nmMid + ", tamTCnt=" + tamTCnt + ", tamTodaycCnt=" + tamTodaycCnt + ", tamToWeekCnt="
				+ tamToWeekCnt + ", twnNickName=" + twnNickName + ", twnMid=" + twnMid + ", tbCnt=" + tbCnt + ", nbDCnt="
				+ nbDCnt + ", nbWCnt=" + nbWCnt + ", nbwnNickName=" + nbwnNickName + ", nbwnMid=" + nbwnMid + ", tgCnt=" + tgCnt
				+ ", mgCnt=" + mgCnt + ", wgCnt=" + wgCnt + ", nmgCnt=" + nmgCnt + ", nwgCnt=" + nwgCnt + "]";
	}

	
	
	
	
	
	
	
	
	

	
}
