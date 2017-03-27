package com.manager.web.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by lifeilong on 2016/4/27.
 */
public class MonitorFilter implements Filter {
    static Logger log = LoggerFactory.getLogger(MonitorFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        long start = System.currentTimeMillis();
        boolean hasExp = true;
        try {
            chain.doFilter(request, response);
            hasExp = false;
        } finally {
            log.info((System.currentTimeMillis() - start) + "ms " + (hasExp ? "has Exception " : "OK ")
                    + ((HttpServletRequest) request).getRequestURI());
        }
    }

    @Override
    public void destroy() {}
}
