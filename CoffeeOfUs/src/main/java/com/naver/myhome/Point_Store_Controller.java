package com.naver.myhome;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.myhome.domain.Board_Event;
import com.naver.myhome.domain.Cart;
import com.naver.myhome.domain.Member;
import com.naver.myhome.domain.Product;
import com.naver.myhome.domain.RecieveAddress;
import com.naver.myhome.service.Board_Event_Service;
import com.naver.myhome.service.EventService;
import com.naver.myhome.service.MemberService;
import com.naver.myhome.service.Point_Store_Service;

@Controller
@RequestMapping(value = "/point_store")
public class Point_Store_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Point_Store_Controller.class);

	@Autowired
	private Point_Store_Service point_store_service;
	@Autowired
	private EventService eventservice;
	@Autowired
	private MemberService memberservice;

	@RequestMapping(value = "list")
	public String Point_Store_list() {
		return "point_store/point_store_list";
	}

	@ResponseBody
	@RequestMapping(value = "/getList")
	// @RequestMapping(value="/wrtie",method=RequestMethod.GET)
	public Map<String, Object> getList(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			@RequestParam(value = "searchword", defaultValue = "", required = false) String searchword,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("id");
		logger.info("컨트롤러searchword======" + searchword);

		int point = 0;
		int cartcount = 0;
		int listcount = 0;
		int limit = 8;
		int maxpage = 0;
		int startpage = ((page - 1) / 5) * 5 + 1;
		int endpage = startpage + 5 - 1;
		List<Product> list = new ArrayList<Product>();

		if (id != null) {
			point = eventservice.getPoint(id);
			logger.info("getList에서 point=" + point);
			cartcount = point_store_service.getCartCount();
			logger.info("getList에서 cartcount=" + cartcount);
		}

		if (searchword == "") {
			listcount = point_store_service.getListCount();
			maxpage = (listcount + limit - 1) / limit;
			if (endpage > maxpage) {
				endpage = maxpage;
			}
			list = point_store_service.getList(page, limit);
		} else {
			listcount = point_store_service.getSearchWordListCount(searchword);
			maxpage = (listcount + limit - 1) / limit;
			if (endpage > maxpage) {
				endpage = maxpage;
			}
			list = point_store_service.getSearchWordList(page, searchword, limit);
		}

		map.put("listcount", listcount);
		map.put("list", list);
		map.put("limit", limit);
		map.put("maxpage", maxpage);
		map.put("startpage", startpage);
		map.put("endpage", endpage);
		map.put("page", page);
		map.put("point", point);
		map.put("cartcount", cartcount);
		map.put("searchword", searchword);

		return map;
	}

	public Cart isProduct(Cart cart) {
		Cart rcart = point_store_service.isProduct(cart);
		return rcart;

	}

	@ResponseBody
	@RequestMapping(value = "addtoCart")
	public String addtoCart(HttpSession session, Cart cart) {
		String id = (String) session.getAttribute("id");

		cart.setId(id);

		Product product = getProductInfo(cart.getCcode());
		String description = product.getDescription();
		String productname = product.getProductname();
		String img = product.getImg();
		cart.setCproductname(productname);
		cart.setCdescription(description);
		cart.setCimg(img);
		int perpoint = cart.getCperpoint();
		int quantity = cart.getCquantity();
		int totalpoint = perpoint * quantity;
		logger.info("totalpoint=" + totalpoint);
		cart.setCtotalpoint(totalpoint);
		Cart rcart = isProduct(cart);

		int suc = 0;
		logger.info("rdata=" + rcart);
		if (rcart == null) {
			logger.info("add");
			suc = point_store_service.addtoCart(cart);
			if (suc == 1) {
				logger.info("addtoCart 성공");
			} else {
				logger.info("addtoCart 실패");
			}
		} else {
			logger.info("update");
			int remain = product.getQuantity();
			logger.info("remain=" + remain);

			int cquantity = rcart.getCquantity();
			logger.info("cquantity=" + cquantity);
			if ((cquantity + quantity) > remain) {

				int addquantity = remain - cquantity;
				cart.setCquantity(addquantity);
				cart.setCtotalpoint(perpoint * addquantity);
			}
			suc = point_store_service.updatetoCart(cart);
			if (suc == 1) {
				logger.info("updatetoCart 성공");
			} else {
				logger.info("updatetoCart 실패");
			}

		}
		String st = "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />";
		st += "<script type='text/javascript'  charset='utf-8'>";
		st += "alert('add Success');";
		st += "location.href='cartListView'";
		st += "</script>";
		return st;

	}

	public Product getProductInfo(int code) {
		Product product = point_store_service.getProductInfo(code);

		return product;
	}

	@RequestMapping(value = "cartListView")
	public String cartListView() {

		return "point_store/cart";

	}

	@ResponseBody
	@RequestMapping(value = "getCartList", method = RequestMethod.POST)
	public Map<String, Object> getCartList(@RequestParam(value = "page") int page,
			@RequestParam(value = "id") String id) {

		Map<String, Object> map = new HashMap<String, Object>();

		int amount = 0;
		int listcount = point_store_service.getCartCount();
		List<Cart> list = point_store_service.getAmount(id);
		for (Cart cart : list) {
			amount += cart.getCtotalpoint();
		}

		List<Cart> cartlist = point_store_service.getCartList(id, page);

		map.put("listcount", listcount);
		map.put("cartlist", cartlist);
		map.put("amount", amount);

		return map;

	}

	@ResponseBody
	@RequestMapping(value = "cartItemDelet", method = RequestMethod.POST)
	public int cartItemDelete(@RequestParam(value = "ccode") int ccode, @RequestParam(value = "id") String id) {

		int result = point_store_service.cartItemDelete(ccode, id);

		return result;
	}

	@RequestMapping(value = "payment")
	public String payment(Model model, HttpSession session) {

		return "point_store/payment";

	}

	@ResponseBody
	@RequestMapping(value = { "Plus", "Minus" }, method = RequestMethod.POST)
	public int Plus(Cart cart) {
		int result = point_store_service.Plus(cart);

		return result;
	}

	@ResponseBody
	@RequestMapping(value = "Keyup", method = RequestMethod.POST)
	public Map<String, Integer> Keyup(Cart cart) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int result = point_store_service.Plus(cart);
		int amount = 0;
		List<Cart> list = point_store_service.getAmount(cart.getId());
		for (Cart rcart : list) {
			amount += rcart.getCtotalpoint();
		}
		map.put("result", result);
		map.put("amount", amount);
		return map;
	}

	@RequestMapping(value = "/productDetail", method = RequestMethod.GET)

	public String Product_Detail(Product product, Model model) {

		model.addAttribute("product", product);
		return "point_store/product_Detail";
	}

	@RequestMapping(value = "/buynow", method = RequestMethod.GET)
	public String buynow(Product product, Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");

		int point = eventservice.getPoint(id);
		List<RecieveAddress> addresslist = point_store_service.getAddressList(id);

		RecieveAddress addressInfo = point_store_service.getCheckAddressInfo(id);

		Member member = memberservice.member_info(id);
		int totalPoint = 0;

		model.addAttribute("addressList", addresslist);
		model.addAttribute("addressInfo", addressInfo);
		model.addAttribute("point", point);
		if (product.getCode() != 0) {
			totalPoint = product.getPerpoint() * product.getQuantity();
			model.addAttribute("member", member);
			model.addAttribute("product", product);
			model.addAttribute("totalPoint", totalPoint);
			model.addAttribute("check", 1);

		} else {
			List<Cart> cartlist = point_store_service.getCartList(id);
			for (Cart cart : cartlist) {
				totalPoint += cart.getCtotalpoint();
			}
			model.addAttribute("totalPoint", totalPoint);
			model.addAttribute("member", member);
			model.addAttribute("cartlist", cartlist);
			model.addAttribute("check", 0);
		}

		return "point_store/payment";

	}

	// address
	@ResponseBody
	@RequestMapping(value = "getAddressList", method = RequestMethod.POST)
	public Map<String, Object> getAddressList(HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("id");

		List<RecieveAddress> addresslist = point_store_service.getAddressList(id);
		map.put("addresslist", addresslist);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "addAddress", method = RequestMethod.POST)
	public Map<String, Object> addAddress(HttpSession session, RecieveAddress addressinfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("id");

		int result = 0;
		addressinfo.setId(id);
		String raddress = addressinfo.getRaddress().trim();
		addressinfo.setRaddress(raddress);

		RecieveAddress address = point_store_service.isAddress(addressinfo);
		logger.info("addressinfo=====" + addressinfo.getRaddress());

		if (address != null) {
			if (address.getRcheck() != 1) {
				logger.info("null 이 아닐때 111111111111");
				point_store_service.updateAddress(addressinfo);
				result = 1;
			}
		} else {
			logger.info("null일때 000000000000");
			point_store_service.addAddress(addressinfo);
			result = 1;
		}
		map.put("result", result);
		return map;
	}

	@RequestMapping(value = "finalPay", method = RequestMethod.POST)
	public String finalPay(HttpSession session, RecieveAddress addressinfo, Member member, Product product,
			@RequestParam(value = "check") int check, @RequestParam(value = "point") int point,
			@RequestParam(value = "totalPoint") int totalpoint, Model model) {

		String id = (String) session.getAttribute("id");

		logger.info("point========" + point);
		logger.info("totalpoint========" + totalpoint);
		int updatePoint = point - totalpoint;
		addressinfo.setId(id);
		String raddress = addressinfo.getRaddress().trim();
		addressinfo.setRaddress(raddress);

		RecieveAddress address = point_store_service.isAddress(addressinfo);
		List<Cart> cartlist = point_store_service.getCartList(id);

		if (address == null) {
			point_store_service.insertAddress(addressinfo);
		}

		point_store_service.reducePoint(id, updatePoint);
		if (check == 0) {
			point_store_service.reduceQuantity(id);
			point_store_service.removeCart(id);
		} else {
			point_store_service.reduceProductQuantity(product);

		}

		model.addAttribute("product", product);
		model.addAttribute("cartlist", cartlist);
		model.addAttribute("member", member);
		model.addAttribute("point", point);
		model.addAttribute("totalPoint", totalpoint);
		model.addAttribute("check", check);
		model.addAttribute("addressInfo", addressinfo);

		return "point_store/success";
	}

}
