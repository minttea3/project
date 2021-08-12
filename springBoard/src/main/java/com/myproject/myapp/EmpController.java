package com.myproject.myapp;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.empVO;
import com.board.service.empService;

@Controller
@RequestMapping("/board/*")

public class EmpController {
	
	@Inject
	private empService service;
	
	//조회
	@RequestMapping(value="/boardList",method=RequestMethod.GET)
	public String getList(Model model) throws IOException{
		List<empVO> list=service.list();
		model.addAttribute("list",list);
		return "board/boardList";
	}
	
	//사원 추가 하기 위해 작성 페이지 이동
	@RequestMapping(value="/boardCreate",method=RequestMethod.GET)
	public String Create() throws IOException{
		return "board/boardCreate";
	}
	//사원 추가 - 작성 post
	//@DateTimeFormat(pattern = "yyyy/MM/dd") Date hiredate;
	@RequestMapping(value = "/boardCreate", method = RequestMethod.POST)
    // public  @ResponseBody String postcreate(empVO vo,@RequestParam("hiredate")  @DateTimeFormat(pattern="yyyy/MM/dd") Date hiredate) {
    public  String postcreate(empVO vo) {
    	 service.empCreate(vo);
       return "redirect:boardList";
    }
	
	// 사원 상세 페이지로 이동
    @RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
    public String getdetail(Model model, int empno) throws IOException{
    	empVO data=service.empdetail(empno);//ename 값 넘김
    	model.addAttribute("data", data);
       return "board/boardDetail";
    }
    // 사원 수정 페이지로 이동
    @RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
    public String getupdate(int empno, Model model) throws Exception {
    	empVO data = service.empdetail(empno);
    	model.addAttribute("data", data);
       return "board/boardUpdate";
    }
    // 사원 수정 post
    @RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
    public String postupdate(empVO vo) throws Exception {
        service.empUpdate(vo);
        return "redirect:boardList"; // 리스트로 리다이렉트
    }
    //사원 삭제
    @RequestMapping(value = "boardDelete", method = RequestMethod.GET)
    public String postdelete(String empno) throws Exception {
    	service.empDelete(empno);
       return "redirect:boardList";
    }
    //게시물 선택삭제
    @RequestMapping(value = "/boardDelete")
    public String ajaxTest(HttpServletRequest request) {
            
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	service.empDelete(ajaxMsg[i]);
        }
        return "redirect:boardList";
    }
    //사원 번호 검색
    @RequestMapping(value="/empnoSearch",method=RequestMethod.GET)
    public String empnoSearchList(int empno, Model model) throws IOException{
    	
    	List<empVO> list2=service.empIdxSearch(empno);
//    	for(int i=0;i<list2.size();i++) {
//    		
//    		System.out.println(list2.get(i));
//    	}
//    	System.out.println(list2.size());;
    	model.addAttribute("list2",list2);
    	return "board/boardList";
    }
    //여러 조건으로 검색
    
    @RequestMapping(value="/empSearch",method=RequestMethod.GET)
    public String empSearch(Model model, String empno, String ename){
    	System.out.println("여기 오지??");
    	//Integer empn = null;
    	Map<String, Object> map = new HashMap<String,Object>();
    	if(empno == "") {
    	}else {
    		int empn=Integer.parseInt(empno);
    		map.put("empno", empn);
    	}
    	map.put("ename", ename);
    	System.out.println(map.get("empno"));
    	System.out.println(map.get("ename"));
    	List<empVO> list2=service.empSearch(map);
    	for(int i = 0; i < list2.size(); i++) {
		
		System.out.println("ddd"+list2.get(i).getEname());
		System.out.println("fff"+list2.get(i).getEname());
		System.out.println();
	
	System.out.println(list2.size());;
	System.out.println(";;;;;;;;");
    	}
    	
    	model.addAttribute("list2",list2);
    	
    	return "board/boardList";
    }
}
    
