package com.Interceptor;

import com.entity.Employee;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object o) throws Exception {
        System.out.println("------------------------------------preHandle------------------------------------");

        String requestURI = req.getRequestURI();

        Employee loginEmpl = (Employee) req.getSession().getAttribute("loginEmpl");
        if (requestURI.indexOf("login")>=0){
            return true;
        } else if (loginEmpl!=null){

            return true;
        } else {
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object o, ModelAndView modelAndView) throws Exception {

        System.out.println("------------------------------------postHandle------------------------------------");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object o, Exception e) throws Exception {

        System.out.println("------------------------------------afterCompletion------------------------------------");

    }
}
