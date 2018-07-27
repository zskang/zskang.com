package com.framework.filter;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Created by zskang on 2017/7/3.
 */
public class AdminInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object object) throws Exception {
        String requestUrl = request.getRequestURI().replace(request.getRequestURI().substring(0, request.getRequestURI().indexOf(request.getContextPath()) + request.getContextPath().length()), "");
        //公共组件无需验证
        if (requestUrl.startsWith("/open")) {
            System.out.println("open time====" + System.currentTimeMillis());
            return true;
        }
        return true;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object object, ModelAndView mav) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object object, Exception exception)
            throws Exception {

    }
}