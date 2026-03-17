package com.example.leaveapp.exception;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException(RuntimeException ex,RedirectAttributes redirectAttributes,HttpServletRequest request)
    {
        redirectAttributes.addFlashAttribute("errorMessage", ex.getMessage());
        String referer = request.getHeader("Referer");
        if(referer == null){
            return "redirect:/login";
        }
        return "redirect:" + referer;
    }
}