package javaweb1J.project.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import javaweb1J.project.admin.AdminVO;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql ="";
	
	// 아이디를 기준으로 모든 데이터를 가져오는 메소드
	public MemberVO getMidCheckAllInfo(String mid) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member where mid =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vo;
	}
	
	//닉네임을 기준으로 모든 데이터를 가져오는 메소드
	public MemberVO getNickNameCheckAllInfo(String nickName) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member where nickName =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}

		return vo;
	}
	
	// 회원가입 메소드.
	public boolean setNewMemberData(MemberVO vo) {
		boolean check = false;
		try {
			sql = "insert into member values (default,?,?,?,?,?"
					+ ",?,?,?,?,?"
					+ ",?,?,?,?"
					+ ",default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getSalt());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getNickName());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getBirthday());
			pstmt.setInt(9, vo.getAge());
			pstmt.setString(10, vo.getGender());
			pstmt.setString(11, vo.getAddress());
			pstmt.setString(12, vo.getRideInfo());
			pstmt.setString(13, vo.getInst());
			pstmt.setString(14, vo.getPhoto());
			pstmt.executeUpdate();
			check = true;
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return check;
	}
	
	public void setTodayLoginUpdate(int idx) {
		try {
			sql="update member set todayCnt=todayCnt+1,lastVisit=now() where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}


	public void setInitializationTodayCnt(int idx) {
		try {
			sql="update member set totCnt=totCnt+1,todayCnt=0 where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public String getMidByEmail(String email) {
		String mid="";
		try {
			sql="select mid from member where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("mid");
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return mid;
	}

	public String setPwdSaltReset(MemberVO vo) {
		String res ="0";
		try {
			sql="update member set salt=?,pwd=? where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getSalt());
			pstmt.setString(2, vo.getPwd());
			pstmt.setInt(3, vo.getIdx());
			pstmt.executeUpdate();
			
			res="1";
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public boolean setMemberInfoUpdate(MemberVO vo) {
		 boolean res =false;
		try {
			sql="update member set "
					+ " name=?, nickName=?, email=?, tel=?, birthday=?, "
					+ " age=?, gender=?, Address=? , rideInfo=? , inst=? ,"
					+ " photo=?"
					+ " where mid=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getBirthday());
			pstmt.setInt(6, vo.getAge());
			pstmt.setString(7, vo.getGender());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getRideInfo());
			pstmt.setString(10, vo.getInst());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getMid());
			pstmt.executeUpdate();
			
			res=true;
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int getTotalRecordCount() {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
	}

	public ArrayList<MemberVO> getAllMemberList(int stIndexNo, int pageSize) {
		 ArrayList<MemberVO> vos = new ArrayList<>();
		 
		 try {
			sql = "select * from member order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
				
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		 
		return vos;
	}

	public void setMemberLevel(int idx, int level) {
		try {
			sql="update member set level=? where idx=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public AdminVO getAdminMemberInfo() {
		AdminVO vo = new AdminVO();
		
		try {
			sql="select (select count(idx) from member where level=5) as l5cnt,"
					+ " (select count(idx) from member where level=4) as l4cnt,"
					+ " (select count(idx) from member where level=3) as l3cnt,"
					+ " (select count(idx) from member where level=2) as l2cnt,"
					+ " (select count(idx) from member where level=1) as l1cnt,"
					+ " (select count(idx) from member where level=0) as l0cnt,"
					+ "	(select count(idx) from member where signInDate >= date_add(now(),interval -24 hour)) as nmcnt,"
					+ " count(idx) as mcnt from member";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				vo.setL5Cnt(rs.getInt("l5cnt"));
				vo.setL4Cnt(rs.getInt("l4cnt"));
				vo.setL3Cnt(rs.getInt("l3cnt"));
				vo.setL2Cnt(rs.getInt("l2cnt"));
				vo.setL1Cnt(rs.getInt("l1cnt"));
				vo.setL0Cnt(rs.getInt("l0cnt"));
				vo.setmCnt(rs.getInt("mcnt"));
				vo.setNewMemberCnt(rs.getInt("nmcnt"));
			}

		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		

		return vo;
	}

	public ArrayList<AdminVO> getAdminNewMemberInfo() {
		ArrayList<AdminVO> vos = new ArrayList<>();
		try {
			sql = "select mid,nickName from member where signInDate >= date_add(now(),interval -24 hour) order by signInDate desc limit 0,5";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				AdminVO vo = new AdminVO();
				vo.setNmMid(rs.getString("mid"));
				vo.setNmNickName(rs.getString("nickName"));
				vos.add(vo);
			}
			
			
		} catch (SQLException e) {
			System.out.println("sql 오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		
		return vos;
	}

	public ArrayList<MemberVO> getfriendList(int idx, int stIndexNo, int pageSize) {
 ArrayList<MemberVO> vos = new ArrayList<>();
		 
		 try {
			sql = "select m.* "
					+ "from 		member m,friend f "
					+ "	where	m.idx=f.fIdx "
					+ "	and f.mIdx=? "
					+ "	and f.fnb=1 "
					+ "order by idx desc "
					+ "limit ?,? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, stIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
				
				vos.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		 
		return vos;
	}
	
	public ArrayList<MemberVO> getBanList(int idx, int stIndexNo, int pageSize) {
		ArrayList<MemberVO> vos = new ArrayList<>();
		
		try {
			sql = "select *,"
					+ " (select fnb from friend where fIdx=? ) "
					+ " from member "
					+ " where idx=(select fidx from friend where mIdx=? and fnb=2)"
					+ " order by idx desc  limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, idx);
			pstmt.setInt(3, stIndexNo);
			pstmt.setInt(4, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setSalt(rs.getString("salt"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setAge(rs.getInt("Age"));
				vo.setGender(rs.getString("gender"));
				
				vo.setAddress(rs.getString("address"));
				vo.setRideInfo(rs.getString("rideinfo"));
				vo.setInst(rs.getString("inst"));
				vo.setPhoto(rs.getString("photo"));
				vo.setLevel(rs.getInt("level"));
				
				vo.setTotCnt(rs.getInt("totCnt"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				vo.setSignInDate(rs.getString("signInDate"));
				vo.setLastVisit(rs.getString("lastVisit"));
				vo.setMemberDel(rs.getString("memberDel"));
				
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	public int getFriendTotalRecordCount(int idx) {
		int trc = 0;
		try {
			sql="select count(fIdx) as cnt from FRIEND where mIDx=? and fnb=1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
	}

	public int getBanTotalRecordCount(int idx) {
		int trc = 0;
		try {
			sql="select count(fIdx) as cnt from FRIEND where mIDx=? and fnb in ('2','3','4')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
	}

	public void setDeleteBanMember(int mIdx, int fIdx) {
		try {
			sql="delete from friend where mIdx=? and fIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mIdx);
			pstmt.setInt(2, fIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
	
	
	
}
