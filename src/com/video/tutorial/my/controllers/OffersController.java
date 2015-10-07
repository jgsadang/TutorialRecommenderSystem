package com.video.tutorial.my.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.video.tutorial.my.dao.Offer;
import com.video.tutorial.my.service.OffersService;

@Controller
public class OffersController {

	/*@RequestMapping("/")
	public ModelAndView showHome() {
		ModelAndView mv = new ModelAndView("home");
		Map<String, Object> map = mv.getModel();
		map.put("name", "mark");
		return mv;
	}*/
	private OffersService offersService;
	
	@Autowired
	public void setOffersService(OffersService offersService) {
		this.offersService = offersService;
	}

	/*@ExceptionHandler(DataAccessException.class)
	public String handleDatabaseException(DataAccessException ex) {
		
		return "error";
	}*/

	@RequestMapping("/offers")
	public String showOffers(Model model) {
		List<Offer> offers = offersService.getCurrent();
		model.addAttribute("offers", offers);
		return "offers";
	}
	
	@RequestMapping("/createoffer")
	public String createOffer(Model model) {
		model.addAttribute("offer", new Offer());
		return "createoffer";
	}
	
	@RequestMapping(value="/doCreate",method=RequestMethod.POST)
	public String doCreate(Model model, @Valid Offer offer, BindingResult result) {
		//System.out.println(offer);
		if (result.hasErrors()) {
			return "createoffer";
		}
		
		offersService.createOffer(offer);
		
		return "offercreated";
	}
}
