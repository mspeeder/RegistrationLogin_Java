package com.mary.belt.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mary.belt.models.Show;
import com.mary.belt.models.User;
import com.mary.belt.services.ShowService;
import com.mary.belt.services.UserService;
import com.mary.belt.validator.UserValidator;






@Controller
public class Users {
	private final UserService userService;
	private final ShowService showService;
	private final UserValidator userValidator;
	public Users(UserService userService,ShowService showService, UserValidator userValidator) {
        this.userService = userService;
        this.showService =showService;
        this.userValidator = userValidator;
	}
	
	@RequestMapping("/")
    public String registerForm(@ModelAttribute("user") User user) {
        return "/tvshows/RegLog.jsp";
    }
	
	// registration data
	@RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		return "/tvshows/RegLog.jsp";
    	} 
    	User u = userService.registerUser(user);
    	session.setAttribute("userId", u.getId());
    	return "redirect:/shows";
    	
    }
	
	// login data
	@RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session) {
        // if the user is authenticated, save their user id in session
        // else, add error messages and return the login page
    	boolean  isAuthenticated = userService.authenticateUser(email, password);
    	if (isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/shows";
    	} else {
    		return "redirect:/createError";
    	}
    }
	// flash message
	@RequestMapping("/createError")
    public String flashMessages(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("error", "Invalid Login Credentials!");
        return "redirect:/";
    }
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        // redirect to login page
    	session.invalidate();
    	return "redirect:/";
    }
	
	// dashboard
	@RequestMapping("/shows")
    public String home(HttpSession session, Model model,@ModelAttribute("show") Show show) {
        // get user from session, save them in the model and return the home page
    	Long userId= (Long) session.getAttribute("userId");
    	User u = userService.findUserById(userId);
    	// display user info on jsp file
    	model.addAttribute("user", u);
    	model.addAttribute("shows", showService.allShows());
    	return "/tvshows/showsPage.jsp";
    }
	
	//
	@RequestMapping("/shows/new")
    public String home(@ModelAttribute("show") Show show) {
    	return "/tvshows/creatShow.jsp";
    }
	
	//
	@RequestMapping(value="/shows/new", method=RequestMethod.POST)
    public String home(@Valid @ModelAttribute("show") Show show, BindingResult result) {
		if (result.hasErrors()) {
			return "/tvshows/creatShow.jsp";
		}
		//
		showService.creatShow(show);
		return "redirect:/shows";
    }
	
	// /shows/{show.id}
	@RequestMapping("/shows/{id}")
	public String showDetail(@PathVariable("id") Long id, Model model,  @ModelAttribute("show") Show show3) {
		Show show = showService.findShow(id);
		model.addAttribute("show", show);
		return "/tvshows/detail.jsp";
	}
	
    // show edit page
    @RequestMapping("/shows/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model, @ModelAttribute("show") Show show2) {
    	Show show = showService.findShow(id);
    	model.addAttribute("show", show);
    	return "/tvshows/edit.jsp";
    	
    }
    
    // update
  	@RequestMapping(value="/shows/{id}/edit", method=RequestMethod.PUT)
      public String update(@Valid @ModelAttribute("show") Show show2, BindingResult result) {
          if (result.hasErrors()) {
              return "/tvshows/edit.jsp";
          } else {
          	 showService.updateShow(show2);
              return "redirect:/shows";
          }
      }
  	
  	// delete
  	@RequestMapping(value="/shows/{id}", method=RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
  		showService.deleteShow(id);
		return "redirect:/shows";
    } 
  	
  	

  	
}
