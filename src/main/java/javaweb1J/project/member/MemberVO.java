package javaweb1J.project.member;

public class MemberVO {
	private int idx;
	private String mid;
	private String salt;
	private String pwd;
	private String name;
	private String nickName;
	private String email;
	private String tel;
	private String birthday;
	private int age;
	private String gender;
	private String address;
	private String rideInfo;
	private String inst;
	private String photo;
	private int	level;
	private int totCnt;
	private int todayCnt;
	private String signInDate;
	private String lastVisit;
	private String memberDel;
	
	private int fnb;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRideInfo() {
		return rideInfo;
	}

	public void setRideInfo(String rideInfo) {
		this.rideInfo = rideInfo;
	}

	public String getInst() {
		return inst;
	}

	public void setInst(String inst) {
		this.inst = inst;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public int getTodayCnt() {
		return todayCnt;
	}

	public void setTodayCnt(int todayCnt) {
		this.todayCnt = todayCnt;
	}

	public String getSignInDate() {
		return signInDate;
	}

	public void setSignInDate(String signInDate) {
		this.signInDate = signInDate;
	}

	public String getLastVisit() {
		return lastVisit;
	}

	public void setLastVisit(String lastVisit) {
		this.lastVisit = lastVisit;
	}

	public String getMemberDel() {
		return memberDel;
	}

	public void setMemberDel(String memberDel) {
		this.memberDel = memberDel;
	}

	public int getFnb() {
		return fnb;
	}

	public void setFnb(int fnb) {
		this.fnb = fnb;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", salt=" + salt + ", pwd=" + pwd + ", name=" + name
				+ ", nickName=" + nickName + ", email=" + email + ", tel=" + tel + ", birthday=" + birthday + ", age=" + age
				+ ", gender=" + gender + ", address=" + address + ", rideInfo=" + rideInfo + ", inst=" + inst + ", photo="
				+ photo + ", level=" + level + ", totCnt=" + totCnt + ", todayCnt=" + todayCnt + ", signInDate=" + signInDate
				+ ", lastVisit=" + lastVisit + ", memberDel=" + memberDel + ", fnb=" + fnb + "]";
	}
	
	
	

}
