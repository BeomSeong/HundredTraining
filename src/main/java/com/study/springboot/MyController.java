package com.study.springboot;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.BoardDao;
import com.study.springboot.dao.ShopBoardDao;
import com.study.springboot.dto.BPageInfo;
import com.study.springboot.dto.BoardDto;
import com.study.springboot.dto.CommentDto;
import com.study.springboot.dto.MemberDto;
import com.study.springboot.dto.PaymentDto;
import com.study.springboot.dto.ReportDto;
import com.study.springboot.dto.ShopBoardDto;
import com.study.springboot.service.IBoardService;
import com.study.springboot.service.ICommentService;
import com.study.springboot.service.ILikeService;
import com.study.springboot.service.IMemberService;
import com.study.springboot.service.IReportService;
import com.study.springboot.service.IShopService;
import com.study.springboot.service.ITrainingService;
import com.study.springboot.service.ShopService;
import com.study.springboot.service.TestService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
@MapperScan("com.study.springboot.dao")
public class MyController {
	
	@Autowired
	private ITrainingService its;
	
	@Autowired
	private IBoardService ibs;
	
	@Autowired
	private ILikeService ils;
	
	@Autowired 
	private IShopService iss;
	
	@Autowired
	private ICommentService ibcs;
	
	@Autowired
	private IMemberService ims;
	
	@Autowired
    private BoardDao boardDao;
	
    @Autowired
    private ShopBoardDao shopBoardDao;
    
    @Autowired
    private ShopService shopService;
    
    @Autowired
    private IReportService irs;
	
	@RequestMapping("/")
	public String root() throws Exception {
		return "redirect:/Main";
	}
	
    @Autowired
    TestService calendarService;
	
	@RequestMapping("/test")
	public String test() {
		return "test/test";
	}
	
	@GetMapping("/event")
	public @ResponseBody List<Map<String, Object>> getEvent() {
		return calendarService.getEventList();
	}
	
	@RequestMapping("/Main")
	public String MainPage(HttpServletRequest request, Model model) {
		// 랜덤 상품 가져오기 (필요에 따라 개수 조절)
	    List<ShopBoardDto> randomProducts = iss.getRandomProducts(6);
	    // 모델에 랜덤 상품 추가
	    model.addAttribute("randomProducts", randomProducts);
	    
	    // 상위 추천 게시물 가져오기
        List<BoardDto> topRecommendedPosts = ibs.getTopRecommendedPosts(10);
        // 모델에 상위 추천 게시물 추가
        model.addAttribute("topRecommendedPosts", topRecommendedPosts);

		return "main/MainPage";
	}
	
	@RequestMapping("/FirTraining")
	public String FirTrainingPage() {
		return "training/FirTrainingPage";
	}
	
	@RequestMapping("/SecTraining")
	public String SecTrainingPage() {
		return "training/SecTrainingPage";
	}
	
	@RequestMapping("/ThiTraining")
	public String ThiTrainingPage() {
		return "training/ThiTrainingPage";
	}
	
	@RequestMapping("/FourTraining")
	public String FourTrainingPage() {
		return "training/FourTrainingPage";
	}
	
	@RequestMapping("/memberCheck")
	@ResponseBody
	public String memberCheck(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String mPwd = request.getParameter("mPwd");
		String json_data = "";
		
		int nResult = ims.loginConfirm(memId, mPwd, request);
		

		if (nResult == -1 || nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"아이디 또는 비밀번호가 틀립니다.\"}";
		} else if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"인증 완료.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/pwModify")
	@ResponseBody
	public String pwModify(HttpServletRequest req) {
		String mId = req.getParameter("mId");
		int nResult = Integer.parseInt(mId);
		String mPwd = req.getParameter("mPwd");
		
		String json_data = "";
		
		HttpSession session = req.getSession();
    	if(session.getAttribute("mId")==null) {
    		
    		json_data = "{\"code\":\"fail\", \"desc\":\"로그인이 필요한 기능입니다.\"}";
    		return json_data;
		}
		

		if(nResult > 1) {
			ims.pwModify(mId, mPwd);
			json_data = "{\"code\":\"success\", \"desc\":\"비밀번호 변경 완료.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"비밀번호 변경 실패.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/findingPw")
	@ResponseBody
	public String findingPw(HttpServletRequest req) {
		String memId = req.getParameter("pwFindId");
//		int nResult = Integer.parseInt(mId);
		String mPwd = req.getParameter("mPwd");
		
		String json_data = "";
		
		int nResult = ims.pwModifyLogin(memId, mPwd);
		
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"비밀번호 변경 완료.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"비밀번호 변경 실패.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "login/login";
	}
	
	@RequestMapping("/loginConfirm")
	@ResponseBody
	public String loginConfirm(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String mPwd = request.getParameter("mPwd");
		String json_data = "";
		
		int nResult = ims.loginConfirm(memId, mPwd, request);
		

    	HttpSession session = request.getSession(true);
    	if(session.getAttribute("mBan")!=null) {
    		json_data = "{\"code\":\"fail\", \"desc\":\"사용 중지된 아이디입니다.\"}";
    		return json_data;
    		
		} else {
			if (nResult == -1) {
				json_data = "{\"code\":\"fail\", \"desc\":\"아이디가 존재하지 않습니다.\"}";
			} else if(nResult == 0) {
				json_data = "{\"code\":\"fail\", \"desc\":\"비밀번호가 틀립니다.\"}";
			} else if(nResult == 1) {
				json_data = "{\"code\":\"success\", \"desc\":\"로그인 되었습니다.\"}";
			} else {
				json_data = "{\"code\":\"fail\", \"desc\":\"존재하지 않는 아이디 입니다.\"}";
			}
			
			return json_data;
		}
	}
	
	@RequestMapping("/snsLoginConfirm")
	@ResponseBody
	public String snsLoginConfirm(HttpServletRequest request) {
		String mPwd = request.getParameter("mPwd");
		String mEmail = request.getParameter("eMail");

		int nResult = ims.snsLoginConfirm(mPwd, mEmail, request);
		
		String json_data = "";
		if (nResult == -1) {
			json_data = "{\"code\":\"success\", \"desc\":\"로그인 되었습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 로그인에 실패했습니다.\"}";
		} else if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"회원가입을 축하합니다.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/join")
	public String join() {
		return "login/join";
	}
	
	@RequestMapping("/joinConfirm")
	@ResponseBody
	public String joinConfirm(HttpServletRequest request) {
		
		
		String memId = request.getParameter("memId");
		String mNick = request.getParameter("mNick");
		String mPwd = request.getParameter("mPwd");
		String mPwdChk = request.getParameter("mPwdChk");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("phoneNumber");
		
		int nResult = ims.joinConfirm(memId, mNick, mPwd, mPwdChk, mEmail, mPhone);
		
		String json_data = "";
		
		if (nResult == -1) {
			json_data = "{\"code\":\"fail\", \"desc\":\"이미 존재하는 아이디입니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 회원가입에 실패했습니다.\"}";
		} else if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"회원가입을 축하합니다.\"}";
		}
	
		return json_data;
	}
	
	@RequestMapping("/findId")
	@ResponseBody
	public String findId(HttpServletRequest request, Model model) {
		
		String mPhone = request.getParameter("submitPhone");
		
		
		Map<String, String> mapReturn = ims.findId(mPhone);
		
		String memId = mapReturn.get("memId");
		String result = mapReturn.get("result");
		String json_data = "";
		
		if (result.equals("success")) {
			json_data = "{\"code\":\"success\", \"desc\":\"일치하는 회원정보를 확인했습니다.\", \"memId\":\"" + memId + "\"}";
		} else if(result.equals("fail")) {
			json_data = "{\"code\":\"fail\", \"desc\":\"일치하는 회원정보가 없습니다.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 아이디 찾기에 실패했습니다.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/findPw")
	@ResponseBody
	public String findPw(HttpServletRequest request, Model model) {
		String memId = request.getParameter("pwFindId");
		String mPhone = request.getParameter("submitPhone");
		
		String json_data = "";
		
		json_data = "{\"code\":\"success\", \"desc\":\"테스트 성공!.\"}";
		
		
		return json_data;
	}
	
    @RequestMapping("/itemView")
    public String itemView(@RequestParam("sId") int sId, Model model) {
        ShopBoardDto product = shopBoardDao.getProductInfo(sId);
        model.addAttribute("product", product);
        return "shop/itemView";
    }
	
    @RequestMapping(value = "/itemBuy", method = RequestMethod.GET)
    public String itemBuy(HttpServletRequest request) {
    	HttpSession session = request.getSession(true);
    	if(session.getAttribute("mId")==null) {
    		return "redirect:/login";
		}
        return "shop/itemBuy";
    }
    
    @RequestMapping(value = "/itemBuy", method = RequestMethod.POST)
    @ResponseBody
    public String processPayment(@RequestParam("pName") String pName,
			 		             @RequestParam("pAddress") String pAddress,
					             @RequestParam("pPhone") String pPhone,
					             @RequestParam("sId") int sId,
					             @RequestParam("mId") int mId,
					             @RequestParam("sTitle") String sTitle,
					             @RequestParam("sMoney") String sMoney,
					             @RequestParam("sFilepath") String sFilepath,
					             @RequestParam("quantity") int quantity,
					             @RequestParam("totalPrice") int totalPrice,
					             @RequestParam("orderId") String orderId,
					             HttpServletRequest request, Model model) {
    	HttpSession session = request.getSession(true);
    	if(session.getAttribute("mId")==null) {
    		return "redirect:/login";
		}
    	
		String json_data = "";
		json_data = shopService.insertPayment(pName, pPhone, pAddress, sId, mId, quantity, totalPrice, orderId);
		
        model.addAttribute("sId", sId);
        
        return json_data;
    }
	
	@RequestMapping("/memQuit")
	public String memQuit() {
		return "myPage/memQuit";
	}
	
	@RequestMapping("/success")
    public String successPage() {
        return "redirect:/paging?pageName=myShop";
    }
	
	@RequestMapping("/deleteDao")
	@ResponseBody
	public String deleteDao(HttpServletRequest req) {
		String mId = req.getParameter("mId");
		int nResult = ims.deleteDao(mId);
	    
	    String json_data = "";
		
	    if (nResult == 1) {
	    	json_data = "{\"code\":\"success\", \"desc\":\"회원 탈퇴되었습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 탈퇴에 실패했습니다.\"}";
		} 
	    
	    return json_data;
	}
	
	
	@RequestMapping("/fBoardView")
	public String viewPost(@RequestParam("fId") int fId,
						   @RequestParam(value = "page", defaultValue = "1") int fEach,
						   @RequestParam(value = "query", defaultValue = "") String query,
						   @RequestParam(value = "search_type", defaultValue = "") String search_type,
						   @RequestParam(value = "best", defaultValue = "") String best,
						   Model model, HttpServletRequest request, HttpServletResponse response) {
		
       String cookieName = "postId_" + fId;
       Cookie[] cookies = request.getCookies();

       if (cookies == null || Arrays.stream(cookies).noneMatch(cookie -> cookie.getName().equals(cookieName))) {

           ibs.upHit(fId);
           
           Cookie viewCookie = new Cookie(cookieName, "viewed");
           viewCookie.setMaxAge(24 * 60 * 60); // 24시간 동안 유지
           viewCookie.setPath("/"); // 쿠키의 유효 경로 설정
           response.addCookie(viewCookie);
       }
		
	    BoardDto post = ibs.getPost(fId);
	    model.addAttribute("post", post);
	    HttpSession session = request.getSession(true);
	    model.addAttribute("sessionId", session.getAttribute("mId"));
	    
	    List<CommentDto> comments = ibcs.BoardCommentList(fId);
	    model.addAttribute("comments", comments);
	    
	    model.addAttribute("fEach", fEach);
	    model.addAttribute("best", best);
	    model.addAttribute("query", query);
    	model.addAttribute("search_type", search_type);
	    
	    
	    return "community/fBoardView";
	}
	
	@RequestMapping("/goodBad")
	@ResponseBody
	public String goodbad(HttpServletRequest request, Model model) {
		String fId = request.getParameter("fId");
		String mNick = request.getParameter("mId");
		String goodBad = request.getParameter("goodBad");
		
		String json_data = "";
		
		HttpSession session = request.getSession();
    	if(session.getAttribute("mId")==null) {
    		
    		json_data = "{\"code\":\"fail\", \"desc\":\"로그인이 필요한 기능입니다.\"}";
    		return json_data;
		}
		
		json_data = ils.goodBadInsert(fId, mNick, goodBad);
		return json_data;
	}
	
	
	@RequestMapping(value = "/fBoardList")
	public String search(@RequestParam(value = "page", defaultValue = "1") int page,
		    			 @RequestParam(value = "count", required = false) Integer count,
		    			 @RequestParam(value = "query", defaultValue = "") String query,
						 @RequestParam(value = "search_type", defaultValue = "") String search_type,
						 @RequestParam(value = "all", defaultValue = "") String all,
						 @RequestParam(value = "best", defaultValue = "") String best,
						 HttpServletRequest request,
						 Model model) {
		HttpSession session = request.getSession();
	    if (count == null) {
	        count = (Integer) session.getAttribute("count");
	        if (count == null) {
	            count = 10;  // 기본값
	        }
	    } else {
	        session.setAttribute("count", count);
	    }
	    List<BoardDto> posts;
	    int totalCount;
	    
	    if (query.equals("")) {
	    	if (best.equals("best")) {
	    		//System.out.println("전체 페이지 -> 베스트 뷰");
	    		posts = ibs.getBestPostsByPage(page, count);
	    		totalCount = ibs.getTotalCountBestPosts();
	    	} else {
	    		//System.out.println("전체 페이지 뷰");
	    		posts = ibs.getPostsByPage(page, count);
		    	totalCount = ibs.getTotalCount();
	    	}
	    } else {
	    	if (best.equals("best")) {
	    		//System.out.println("검색 + 베스트 뷰 ");
	    		posts = ibs.getBestPostsByPageSearch(query, search_type, page, count);
	    		totalCount = ibs.getTotalCountBestPostsSearch(query, search_type);
	    		model.addAttribute("best", best);
	    	} else {
	    		//System.out.println("전체 페이지 검색 뷰");
	    		posts = ibs.searchPosts(query, search_type, page, count);
		    	totalCount = ibs.getTotalCountSearch(query, search_type);
	    	}
	    	
	    }
	    model.addAttribute("fEach", page);
	    model.addAttribute("best", best);
	    model.addAttribute("query", query);
    	model.addAttribute("search_type", search_type);
	   
	    BPageInfo pageInfo = new BPageInfo();
	    pageInfo.setCurPage(page);
	    pageInfo.setListCount(count);
	    pageInfo.setTotalCount(totalCount);

	    int totalPage = totalCount / count;
	    if (totalCount % count > 0) {
	        totalPage++;
	    }
	    pageInfo.setTotalPage(totalPage);

	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = startPage + 10 - 1;

	    if (endPage > totalPage) {
	        endPage = totalPage;
	    }

	    pageInfo.setStartPage(startPage);
	    pageInfo.setEndPage(endPage);

	    model.addAttribute("posts", posts);
	    model.addAttribute("page", pageInfo);
	    
	    
	    return "community/fBoardList";
	}
	
	

	@RequestMapping("/fBoardModify")
	public String modifyView(HttpServletRequest req, Model model) {
		
		String fId = req.getParameter("fId");
		
	    BoardDto post = boardDao.getPost(Integer.parseInt(fId));
		model.addAttribute("post", post);
		
		return "community/fBoardModify";
	}
	
	@RequestMapping("/modifyBoard")
	public String modifyBoard(HttpServletRequest req, @RequestParam("files") MultipartFile files) {
		String fId = req.getParameter("fId");
		String fTitle = req.getParameter("fTitle");
		String fContent = req.getParameter("fContent");
		
		String fileName = "";
    	String filePath = "";
    	
    	if (!files.isEmpty()) {
	        fileName = files.getOriginalFilename();
	        filePath = "C:/WorkSpace/sts-work/TrainingProject/src/main/resources/static" + fileName;
	        File file = new File(filePath);
	        try {
	            files.transferTo(file);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

    	ibs.modifyBoard(fId, fTitle, fContent, fileName, filePath, req);
		
		return "redirect:/fBoardView?fId="+fId;
	}

	
	@RequestMapping("/fBoardWrite")
	public String fBoardWrite() {
		return "community/fBoardWrite";
	}
	
	@PostMapping("/createPost")
	public String createPost(BoardDto post, @RequestParam("files") MultipartFile files, HttpServletRequest request) {
		
		HttpSession session = request.getSession(true);
		if(session.getAttribute("mId")==null) {
    		return "redirect:/login";
		}
			
		if (!files.isEmpty()) {
	        String fileName = files.getOriginalFilename();
	        String filePath = "/home/ec2-user/apache-tomcat-10.1.16/webapps/TrainingProject/WEB-INF/classes/static/images/boardImg/" + fileName;
	        					
	        File file = new File(filePath);
	        try {
	            files.transferTo(file);
	            filePath = filePath.substring(filePath.indexOf("/images"));
	            post.setfFilename(fileName);
	            post.setfFilepath(filePath);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    boardDao.createPost(post);
	    
	    return "redirect:/fBoardList";
	}
	
	@RequestMapping("/deletePost")
	@ResponseBody
	public String deletePost(HttpServletRequest request) {
		String fId = request.getParameter("fId");
		int nResult = ibs.deletePost(fId);
	    
	    String json_data = "";
		
	    if (nResult == 1) {
	    	json_data = "{\"code\":\"success\", \"desc\":\"게시글이 삭제가 완료되었습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 게시글 삭제에 실패했습니다.\"}";
		} 
	    
	    return json_data;
	}
	
	@RequestMapping("/submitComment")
	@ResponseBody
	public String submitComment(HttpServletRequest request) {
		String cContent = request.getParameter("cContent");
		String mId = request.getParameter("mId");
		String fId = request.getParameter("fId");
		
	    String json_data = "";
	    
	    HttpSession session = request.getSession();
    	if(session.getAttribute("mId")==null) {
    		
    		json_data = "{\"code\":\"fail\", \"desc\":\"로그인이 필요한 기능입니다.\"}";
    		return json_data;
		}
    	
	    json_data = ibcs.insertComment(cContent, mId, fId);
	    
	    return json_data;
	}
	
	@RequestMapping("/submitDelComment")
	@ResponseBody
	public String submitDelComment(HttpServletRequest request) {
		String cId = request.getParameter("cId");
	    String json_data = "";
    	HttpSession session = request.getSession();
    	if(session.getAttribute("mId")==null) {
    		
    		json_data = "{\"code\":\"fail\", \"desc\":\"로그인이 필요한 기능입니다.\"}";
    		return json_data;
		}
	    
	    
	    json_data = ibcs.deleteComment(cId);
	    
	    return json_data;
	}
	
	@RequestMapping("/submitReport")
	@ResponseBody
	public String submitReport(HttpServletRequest request) {
		String rCategory = request.getParameter("rCategory");
		String rTitle = request.getParameter("rTitle");
		String rContent = request.getParameter("rContent");
		String mId = request.getParameter("mId");
		String fId = request.getParameter("fId");

		String json_data = "";
	    json_data = irs.insertReport(rCategory, rTitle, rContent, mId, fId);
	    
	    return json_data;
	}
	
	@RequestMapping("/mapview")
	public String mapview() {
		return "community/mapview";
	}
	
	@RequestMapping("/myRecord")
	public String myRecord(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession(true);
		if(session.getAttribute("mId")==null) {
    		return "redirect:/login";
		}
		
		String mId = req.getParameter("mId");
		
		model.addAttribute("selData", its.Chart(Integer.parseInt(mId)));
		return "myPage/myRecord";
	}
	
	@RequestMapping("/selData")
	public String selData(int year, int month, Model model, HttpServletRequest request) {
		String mId = request.getParameter("mId");	
		
		model.addAttribute("selData", its.selData(Integer.parseInt(mId), year, month));
		
		return "myPage/myRecord";
	}

	
	@RequestMapping("/recordForm")
	@ResponseBody
	public String recordForm(HttpServletRequest request) {
		
		String mId = request.getParameter("mId");
		String tPushNum = request.getParameter("tPushNum");
		String tSitupNum = request.getParameter("tSitupNum");
		String tPullupNum = request.getParameter("tPullupNum");
		String tRunDist = request.getParameter("tRunDist");
		String tDate = request.getParameter("tDate");
		
        int nResult = its.Training(
        		Integer.parseInt(mId),
                Integer.parseInt(tPushNum),
                Integer.parseInt(tSitupNum),
                Integer.parseInt(tPullupNum),
                Integer.parseInt(tRunDist),
                Integer.parseInt(tDate)
            );
		
		String json_data = "";
		
		if(nResult != 0) {
			json_data = "{\"code\":\"success\", \"desc\":\"기록 성공.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"기록 실패.\"}";
		}
	
		return json_data;
	}
	
    
	
    @RequestMapping("/shopview")
    public String shopview(Model model) {
    	List<ShopBoardDto> products = shopBoardDao.getAllProducts();
        model.addAttribute("products", products);
        return "shop/shopview";
    }
	
	@RequestMapping("/change")
	public String change(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("mId")==null) {
    		return "redirect:/login";
		}
		
		return "myPage/change";
	}
	
	@RequestMapping("/pwCheck")
	@ResponseBody
	public String pwCheck(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		
		String memId = (String)session.getAttribute("memId");
		String mPwd = request.getParameter("mPwd");
		
	    String json_data = "";
	    json_data = ims.pwCheck(memId, mPwd);
	    
	    return json_data;
	}
	
	@RequestMapping("/myInformModify")
	public String myInformModify() {
		return "myPage/myInformModify";
	}
	
	@RequestMapping("/updateMem")
	@ResponseBody
	public String updateMem(HttpServletRequest request) {
		String mId = request.getParameter("mId");
		String memId = request.getParameter("memId");
		String mNick = request.getParameter("mNick");
		String mEmail = request.getParameter("mEmail");
		
		int nResult = ims.updateMem(mId, memId, mNick, mEmail, request);
		String json_data = "";
		
		if (nResult == -1) {
			json_data = "{\"code\":\"fail\", \"desc\":\"이미 존재하는 아이디 입니다.\"}";	    	
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 정보 수정에 실패했습니다.\"}";
		} else if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"정보 수정이 완료되었습니다.\"}";
		}
	    
	    return json_data;
	}
	
	@RequestMapping("/host")
	public String host() {
		return "host/hostLogin";
	}
	
	@RequestMapping("/hostLoginConfirm")
	@ResponseBody
	public String hostLoginConfirm(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String mPwd = request.getParameter("mPwd");
		String mAdmin = request.getParameter("mAdmin");
		String json_data = "";
		
		int nResult = ims.hostLoginConfirm(memId, mPwd, mAdmin, request);

		if (nResult == -1) {
			json_data = "{\"code\":\"fail\", \"desc\":\"아이디가 존재하지 않습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"비밀번호가 틀립니다.\"}";
		} else if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"로그인 되었습니다.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"코드가 일치하지 않습니다.\"}";
		}
		
		return json_data;
	}
	
	
	
	@RequestMapping("/memberBanInsert")
	@ResponseBody
	public String memberBanInsert(HttpServletRequest req, Model model) {
		String mId = req.getParameter("mId");
		
		String json_data = "";
		
		int nResult = ims.memberBanInsert(mId, req);
		
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"회원 정지 완료.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
	}

	@RequestMapping("/memberBanDelete")
	@ResponseBody
	public String memberBanDelete(HttpServletRequest req, Model model) {
		String mId = req.getParameter("mId");
		
		int nResult = ims.memberBanDelete(mId, req);
		String json_data = "";
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"회원 정지 취소.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
		
	}
	
	@RequestMapping("/memberAdminInsert")
	@ResponseBody
	public String memberAdminInsert(HttpServletRequest req, Model model) {
		String mId = req.getParameter("mId");
		
		String json_data = "";
		
		int nResult = ims.memberAdminInsert(mId, req);
		
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"관리자 지정 완료.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
	}

	@RequestMapping("/memberAdminDelete")
	@ResponseBody
	public String memberAdminDelete(HttpServletRequest req, Model model) {
		String mId = req.getParameter("mId");
		
		int nResult = ims.memberAdminDelete(mId, req);
		String json_data = "";
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"관리자 지정 취소.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
		
	}
	
	
	
	@RequestMapping("/hBoardDelete")
	@ResponseBody
	public String hBoardDelete(HttpServletRequest request) {
		String fId = request.getParameter("fId");
		int nResult = ibs.deletePost("deletePost : " + fId);
	    
	    String json_data = "";
		
	    if (nResult == 1) {
	    	json_data = "{\"code\":\"success\", \"desc\":\"게시글이 삭제가 완료되었습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 게시글 삭제에 실패했습니다.\"}";
		} 
	    
	    return json_data;
	}
	
	@RequestMapping("/submitDelBoard")
	@ResponseBody
	public String submitDelBoard(HttpServletRequest request) {
		String fId = request.getParameter("fId");
	    String json_data = "";
	    json_data = ibs.deleteBoard(fId);
	    
	    return json_data;
	}
	
    @RequestMapping("/hShopInsert")
    public String hShopInsert(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	if(session.getAttribute("mId")==null) {
    		return "redirect:/host";
		}
       return "host/hShopInsert";
    }
    
    @RequestMapping("/hShopProductInsert")
    public String hShopProductInsert(ShopBoardDto post, @RequestParam("files") MultipartFile files,
    								 HttpServletRequest request) {
    	
    	String sCategory = request.getParameter("sCategory");
    	String sTitle = request.getParameter("sTitle");
    	String sMoney = request.getParameter("sMoney");
    	String sContent = request.getParameter("sContent");
    	String fileName = "";
    	String filePath = "";
    	
    	if (!files.isEmpty()) {
	        fileName = files.getOriginalFilename();
	        filePath = "/home/ec2-user/apache-tomcat-10.1.16/webapps/TrainingProject/WEB-INF/classes/static/images/" + sCategory + "/" + fileName;
	        File file = new File(filePath);
	        try {
	            files.transferTo(file);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
    	iss.hShopProductInsert(sTitle, sContent, sMoney, fileName, filePath, sCategory);
    	
    	
       return "redirect:admin/hShopView";
    }
    
	@RequestMapping("/submitDelshop")
	@ResponseBody
	public String submitDelShop(HttpServletRequest req, Model model) {
		String sId = req.getParameter("sId");
		int nResult = iss.deleteShop(Integer.parseInt(sId));
        
        String json_data = "";
        
        
    	if (nResult == 1) {
    		
	    	json_data = "{\"code\":\"success\", \"desc\":\"게시글이 삭제가 완료되었습니다.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러가 발생하여 게시글 삭제에 실패했습니다.\"}";
		}

        return json_data;
	}
    
    @RequestMapping("/shopModify")
	public String shopModify(HttpServletRequest req, Model model) {
		String sId = req.getParameter("sId");
		ShopBoardDto post = iss.shopModify(Integer.parseInt(sId));
		model.addAttribute("post", post);
        
        return "host/hShopModify";
	}
	
	@RequestMapping("/reportNoCheck")
	@ResponseBody
	public String reportNoCheck(HttpServletRequest req, Model model) {
		String rId = req.getParameter("rId");
		
		int nResult = irs.reportNoCheck(rId, req);
		String json_data = "";
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"체크 취소.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
		
	}
	
	@RequestMapping("/reportCheck")
	@ResponseBody
	public String reportCheck(HttpServletRequest req, Model model) {
		String rId = req.getParameter("rId");
		
		String json_data = "";
		
		int nResult = irs.reportCheck(rId, req);
		
		
		if(nResult == 1) {
			json_data = "{\"code\":\"success\", \"desc\":\"체크 성공.\"}";
		} else if(nResult == 0) {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		} else {
			json_data = "{\"code\":\"fail\", \"desc\":\"에러 발생.\"}";
		}
		
		return json_data;
	}
	
	@RequestMapping("/modifyShopBoard")
	public String modifyShopBoard(HttpServletRequest request, @RequestParam("files") MultipartFile files) {
		String sId = request.getParameter("sId");
		String sTitle = request.getParameter("sTitle");
		String sContent = request.getParameter("sContent");
		String sCategory = request.getParameter("sCategory");
		
    	String fileName = "";
    	String filePath = "";
    	
    	if (!files.isEmpty()) {
	        fileName = files.getOriginalFilename();
	        filePath = "/home/ec2-user/apache-tomcat-10.1.16/webapps/TrainingProject/WEB-INF/classes/static/images/" + sCategory + "/" + fileName;
	        File file = new File(filePath);
	        try {
	            files.transferTo(file);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
    	int nResult = iss.modifyShopBoard(Integer.parseInt(sId), sTitle, sContent, fileName, filePath, sCategory);
	    
	    return "redirect:admin/hShopView";
	}
	
	@RequestMapping(value = "/paging", method = RequestMethod.GET)
	public String Paging(@RequestParam(value = "page", defaultValue = "1") int page,
		    			 @RequestParam(value = "count", required = false) Integer count,
		    			 @RequestParam(value = "query", defaultValue = "") String query,
						 @RequestParam(value = "search_type", defaultValue = "") String search_type,
						 @RequestParam(value = "pageName") String pageName,
						 HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
	    if (count == null) {
	        count = (Integer) session.getAttribute("count");
	        if (count == null) {
	            count = 10;  // 기본값
	        }
	    } else {
	        session.setAttribute("count", count);
	    }
	    int totalCount;
	    String pageSelect;
	    
	    if (pageName.equals("myComment")) {     // 마이페이지 댓글
	    	if(session.getAttribute("mId")==null) {
	    		return "redirect:/login";
			}
	    	int mId = (Integer) session.getAttribute("mId");
	    	
	    	List<CommentDto> posts = ibcs.getMyCommentPage(mId, page, count);
    		totalCount = ibcs.getTotalCountMyCommentPage(mId);
    		
    		model.addAttribute("posts", posts);
    		
    		pageSelect = "myPage/myComment";
    		
	    } else if (pageName.equals("myBoard")){ 	// 마이페이지 게시글
	    	if(session.getAttribute("mId")==null) {
	    		return "redirect:/login";
			}
	    	int mId = (Integer) session.getAttribute("mId");

	    	List<BoardDto> posts = ibs.getMyBoardPage(mId, page, count);
    		totalCount = ibs.getTotalCountMyBoardPage(mId);
    		
    		model.addAttribute("posts", posts);
    		
    		pageSelect = "myPage/myBoard";
    		
	    } else if (pageName.equals("myShop")){ 	// 마이페이지 구매내역
	    	if(session.getAttribute("mId")==null) {
	    		return "redirect:/login";
			}
	    	int mId = (Integer) session.getAttribute("mId");
			
	    	List<PaymentDto> posts = iss.getMyShopPage(mId, page, count);
    		totalCount = iss.getTotalCountMyShopPage(mId);
    		
    		model.addAttribute("posts", posts);
    		
    		pageSelect = "myPage/myShop";
    		
	    } else if (pageName.equals("admin/hMember")){ 	// 관리자 회원관리
	    	
	    	if(session.getAttribute("mAdmin")==null) {
	    		return "redirect:/host";
			}
	    	if (query.equals("") && !(search_type.equals("mBan")||search_type.equals("mAdmin"))) {
		    	List<MemberDto> posts = ims.getMemberListPage(page, count);
	    		totalCount = ims.getTotalCountMemberListPage();
				
	    		model.addAttribute("posts", posts);
	    	} else {
	    		List<MemberDto> posts = ims.getMemberListSearch(query, search_type, page, count);
	    		totalCount = ims.getTotalCountMemberListSearch(query, search_type);
				
	    		model.addAttribute("posts", posts);
				
	    	}
	    	pageSelect = "host/hMember";
	    	
	    } else if (pageName.equals("admin/hBoardView")){ 	// 관리자 작성글관리
	    	
	    	if(session.getAttribute("mAdmin")==null) {
	    		return "redirect:/host";
			}
	    	if (query.equals("")) {
		    	List<BoardDto> posts = ibs.getAllPostsPage(page, count);
	    		totalCount = ibs.getTotalCountAllPostsPage();
				
	    		model.addAttribute("posts", posts);
	    	
	    	} else {
	    		List<BoardDto> posts = ibs.getAllPostsSearch(query, search_type, page, count);
	    		totalCount = ibs.getTotalCountAllPostsSearch(query, search_type);
				
	    		model.addAttribute("posts", posts);
	    	}
	    	pageSelect = "host/hBoardView";
	    	
	    } else if (pageName.equals("admin/hComment")){ 	// 관리자 댓글관리
	    	
	    	if(session.getAttribute("mAdmin")==null) {
	    		return "redirect:/host";
			}
	    	if (query.equals("")) {
		    	List<CommentDto> posts = ibcs.getCommentListPage(page, count);
	    		totalCount = ibcs.getTotalCountCommentListPage();
				
	    		model.addAttribute("posts", posts);
	    	
	    	} else {
	    		List<CommentDto> posts = ibcs.getCommentListSearch(query, search_type, page, count);
	    		totalCount = ibcs.getTotalCountCommentListSearch(query, search_type);
				
	    		model.addAttribute("posts", posts);
	    	}
	    	pageSelect = "host/hComment";
	    	
	    } else if (pageName.equals("admin/hShopView")){ 	// 관리자 상품관리
	    	
	    	if(session.getAttribute("mAdmin")==null) {
	    		return "redirect:/host";
			}
	    	if (query.equals("")) {
		    	List<ShopBoardDto> posts = iss.getAllProductsPage(page, count);
	    		totalCount = iss.getTotalCountAllProductsPage();
				
	    		model.addAttribute("posts", posts);
	    	
	    	} else {
	    		List<ShopBoardDto> posts = iss.getAllProductsSearch(query, search_type, page, count);
	    		totalCount = iss.getTotalCountAllProductsSearch(query, search_type);
				
	    		model.addAttribute("posts", posts);
	    	}
	    	pageSelect = "host/hShopView";
	    	
	    } else if (pageName.equals("admin/hReport")){ 	// 관리자 신고관리
	    	
	    	if(session.getAttribute("mAdmin")==null) {
	    		return "redirect:/host";
			}
	    	if (query.equals("")) {
		    	List<ReportDto> posts = irs.getReportPage(page, count);
	    		totalCount = irs.getTotalCountReportPage();
				
	    		model.addAttribute("posts", posts);
	    		
	    	} else {
	    		List<ReportDto> posts = irs.getReportSearch(query, search_type, page, count);
	    		totalCount = irs.getTotalCountReportSearch(query, search_type);
				
	    		model.addAttribute("posts", posts);
	    	}
	    	pageSelect = "host/hReport";
	    	
	    } else {
	    	return "redirect:/Main";
	    }

	    model.addAttribute("fEach", page);
	    model.addAttribute("query", query);
    	model.addAttribute("search_type", search_type);
    	model.addAttribute("pageName", pageName);
	   
	    BPageInfo pageInfo = new BPageInfo();
	    pageInfo.setCurPage(page);
	    pageInfo.setListCount(count);
	    pageInfo.setTotalCount(totalCount);

	    int totalPage = totalCount / count;
	    if (totalCount % count > 0) {
	        totalPage++;
	    }
	    pageInfo.setTotalPage(totalPage);

	    int startPage = ((page - 1) / 10) * 10 + 1;
	    int endPage = startPage + 10 - 1;

	    if (endPage > totalPage) {
	        endPage = totalPage;
	    }

	    pageInfo.setStartPage(startPage);
	    pageInfo.setEndPage(endPage);

	    
	    model.addAttribute("page", pageInfo);
	    
	    
	    return pageSelect;
	}
	
	
}
