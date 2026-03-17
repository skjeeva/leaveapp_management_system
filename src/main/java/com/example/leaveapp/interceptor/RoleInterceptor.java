package com.example.leaveapp.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class RoleInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                         HttpServletResponse response,
                         Object handler) throws Exception {

    HttpSession session = request.getSession(false);

    if (session == null) {
        response.sendRedirect("/login");
        return false;
    }

    String role = (String) session.getAttribute("role");

    if (role == null) {
        session.invalidate();
        response.sendRedirect("/login");
        return false;
    }

    String uri = request.getRequestURI();

    if (uri.startsWith("/admin") && !"ADMIN".equals(role)) {

        session.setAttribute("errorMessage",
                "Access Denied: Admin access required");

        response.sendRedirect(getDashboard(role));
        return false;
    }

    if (uri.startsWith("/manager") && !"MANAGER".equals(role)) {

        session.setAttribute("errorMessage",
                "Access Denied: Manager access required");

        response.sendRedirect(getDashboard(role));
        return false;
    }

    if (uri.startsWith("/employee") && !"EMPLOYEE".equals(role)) {

        session.setAttribute("errorMessage",
                "Access Denied: Employee access required");

        response.sendRedirect(getDashboard(role));
        return false;
    }

    return true;
    }
    private String getDashboard(String role) {
        if ("ADMIN".equals(role)) return "/admin/dashboard";
        if ("MANAGER".equals(role)) return "/manager/dashboard";
        return "/employee/dashboard";
    }
}