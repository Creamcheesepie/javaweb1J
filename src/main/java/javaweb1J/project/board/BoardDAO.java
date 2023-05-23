package javaweb1J.project.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	private String sql="";

	public ArrayList<BoardVO> getBoardList(int stIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<>();
		
		try {
			sql = "select *,"
					+ " (select nickName from member where idx=b.midx)as aNickName,"
					+ " (select mid from member where idx=b.midx)as aMid"
					+ " from board b"
					+ " order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setCategory(rs.getString("category"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setRecommend(rs.getInt("recommend"));
				vo.setaMid(rs.getString("aMid"));
				vo.setaNickName(rs.getString("aNickName"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류1 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	public int getTotalRecordCount() {
		int trc = 0;
		try {
			sql="select count(idx) as cnt from board";
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

	public boolean setBoardArticle(BoardVO vo) {
		boolean check = false;
		try {
			sql = "insert into board values(default,?,?,?,default,?,?,default, default)";
			pstmt  = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getmIdx());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getArticle());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getCategory());
			pstmt.executeUpdate();
			check=true;
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}

		return check;
	}

	public BoardVO getBoardArticleBy_Title_And_mIdx(String title, int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where midx=? and title=? order by idx desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, title);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setArticle(rs.getString("Article"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setCategory(rs.getString("category"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setRecommend(rs.getInt("recommend"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return vo;
	}

	public BoardVO getBoardArticleByIdx(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select *,"
					+ " (select nickName from member where idx=b.midx)as aNickName,"
					+ " (select mid from member where idx=b.midx)as aMid"
					+ " from board b where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setmIdx(rs.getInt("mIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setArticle(rs.getString("Article"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setCategory(rs.getString("category"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setRecommend(rs.getInt("recommend"));
				vo.setaMid(rs.getString("aMid"));
				vo.setaNickName(rs.getString("aNickName"));
			}
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		
		return vo;
	}

	public void setViewCntUp(int idx) {
		try {
			sql="update board set viewCnt=viewCnt+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public boolean setBoardArticleUpdate(BoardVO vo) {
		boolean check =false;
		try {
			sql="update board set title=?,article=?,hostIp=?,category=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getArticle());
			pstmt.setString(3, vo.getHostIp());
			pstmt.setString(4, vo.getCategory());
			pstmt.setInt(5, vo.getIdx());
			pstmt.executeUpdate();
			
			check=true;
		} catch (SQLException e) {
			System.out.println("sql 오류2 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return check;
	}
	
}
