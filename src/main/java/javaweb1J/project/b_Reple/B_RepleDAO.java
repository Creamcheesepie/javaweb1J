package javaweb1J.project.b_Reple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import javaweb1J.project.board.BoardVO;

public class B_RepleDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	private String sql="";

	public String setRepleWrite(B_RepleVO vo) {
		String res = "0";
		
		try {
			sql="insert into b_reple values(default,?,?,?,default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getbIdx());
			pstmt.setInt(2, vo.getmIdx());
			pstmt.setString(3, vo.getReple());
			pstmt.executeUpdate();
			res="1";
			
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}

		return res;
	}

	public ArrayList<B_RepleVO> getRepleList(int idx,int stIndexNo, int pageSize) {
		ArrayList<B_RepleVO> vos = new ArrayList<>();
		
		try {
			sql="select *, "
					+ " (select nickName from member where idx=r.midx)as aNickName,"
					+ " (select mid from member where idx=r.midx)as aMid"
					+ " from b_reple r where bIdx=? order by idx limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, stIndexNo);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				B_RepleVO vo = new B_RepleVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setbIdx(rs.getInt("bIdx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setReple(rs.getString("reple"));
				vo.setwTime(rs.getString("wTime"));
				vo.setaMid(rs.getString("aMid"));
				vo.setaNickName(rs.getString("aNickName"));
				vos.add(vo);
			}
			
		} catch (SQLException e) {
			System.out.println("sql오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return vos;
	}

	public int getTotalRecordCount(int bIdx) {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from b_reple where bidx =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) trc=rs.getInt("cnt");
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return trc;
	}

	public void setBoardRepleDelete(int idx) {
		try {
			sql = "delete from b_reple where bIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

	public String setRepleUpdate(int idx, String reple) {
		String res = "0";
		try {
			sql="update b_reple set reple=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, reple);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
	public String setRepleDelete(int idx) {
		String res = "0";
		try {
			sql="delete from b_reple where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res="1";
		} catch (SQLException e) {
			System.out.println("sql 오류 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
}
