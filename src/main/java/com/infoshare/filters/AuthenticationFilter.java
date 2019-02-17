package com.infoshare.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/AuthenticationFilter")
public class AuthenticationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        this.context.log("Requested Resource::" + uri);

        HttpSession session = req.getSession(false);


        boolean endsWithIndexJSP = uri.endsWith("index.jsp");
        boolean endsWithLoginServlet = uri.endsWith("LoginServlet");
        if (session != null && session.getAttribute("user") == null && !(endsWithIndexJSP || endsWithLoginServlet)) {
            this.context.log("Unauthorized access request");
            res.sendRedirect("index.jsp");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }

}