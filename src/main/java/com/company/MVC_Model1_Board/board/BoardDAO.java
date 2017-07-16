package com.company.MVC_Model1_Board.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.MVC_Model1_Board.common.JDBCUtil;

public class BoardDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String BOARD_LIST = "select * from board order by seq desc";
	private final String BOARD_INSERT = "insert into board(title, writer, content, regdate)"
										+" values (?,?,?,now())";
	private final String BOARD_GET = "select * from board where seq=?";
	private final String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
	private final String BOARD_DELETE = "delete from board where seq=?";
	
	public List<BoardVO> getBoardList(BoardVO vo){
		System.out.println("getBoardList()");
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(BOARD_LIST);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setContent(rs.getString("CONTENT"));
				
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		return boardList;
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("JDBC insertBoard");
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(BOARD_INSERT);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, con);
		}
	}
	
	public BoardVO getBoard(BoardVO vo) {
		BoardVO board = null;
		try {
			con = JDBCUtil.getConnection();
			String UPDATE_CNT = "update board set cnt=cnt+1 where seq=?";
			pstmt = con.prepareStatement(UPDATE_CNT);
			pstmt.setInt(1, vo.getSeq());
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(BOARD_GET);
			pstmt.setInt(1, vo.getSeq());
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				board = new BoardVO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setRegDate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
				board.setContent(rs.getString("CONTENT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, con);
		}
		
		return board;
	}
	
	public void updateBoard(BoardVO vo){
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            con = JDBCUtil.getConnection();
            pstmt = con.prepareStatement(BOARD_UPDATE);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getContent());
            pstmt.setInt(3, vo.getSeq());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(pstmt, con);
        }
    }    
    
    // 글 삭제
    public void deleteBoard(BoardVO vo){
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            con = JDBCUtil.getConnection();
            pstmt = con.prepareStatement(BOARD_DELETE);
            pstmt.setInt(1, vo.getSeq());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(pstmt, con);
        }
    }
}
