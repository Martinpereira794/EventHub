package com.martin.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.martin.demo.models.Province;
import com.martin.demo.models.User;
import com.martin.demo.services.AppService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class UsersController {

    @Autowired
    private AppService serv;

    @GetMapping("/register")
    public String registerForm(@ModelAttribute("newUser") User newUser, Model model) {
        model.addAttribute("provinces", Province.Provinces);
        return "register.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result,
                           HttpSession session,
                           Model model) {
        serv.register(newUser, result);

        if (result.hasErrors()) {
            model.addAttribute("provinces", Province.Provinces);
            return "register.jsp";
        } else {
            session.setAttribute("userInSession", newUser);
            return "redirect:/home";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login.jsp";
    }

    @PostMapping("/login2")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        RedirectAttributes redirectAttributes,
                        HttpSession session) {
        User userTryingLogin = serv.login(email, password);
        if (userTryingLogin == null) {
            redirectAttributes.addFlashAttribute("errorLogin", "Wrong email/password");
            return "redirect:/login";
        } else {
            session.setAttribute("userInSession", userTryingLogin);
            return "redirect:/home";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userInSession");
        return "redirect:/";
    }
}
