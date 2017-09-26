package model;

public class Paging {
	 //화면에 보여질 게시글의 개수를 지정
    private int pageSize=10;
    private int count =0; //전체 글의 갯수를 저장하는 변수
    private int number =0; //페이지 넘버링 변수
    private String pageNum;
    
	public Paging(String pageNum) {
	 //만약 처음 boardList.jsp를 클릭하거나 수정 삭제 등 다른 게시글에서 이 페이지로 넘어오면 pageNum값이 없기에 null 처리를 해줌
	  if(pageNum==null){
			 pageNum="1";
	  }
	
	  this.pageNum=pageNum;
	  
	  //전체 보고자 하는 페이지숫자를 저장
	  int currentPage =Integer.parseInt(pageNum);
	}
	 
	 
	 

	
	 

	 	
	
}
