package org.zerock.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

//기존 - web.xml 이용해 스프링 구동
//web.xml 대신하는
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

	//root-context.xml 대신
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

	//web.xml에서 스프링MVC의 모든 요청 DispatcherServlet 통해 처리되므로 에러404도 같이 처리할 수 있도록 //근데 오버라이드 주석
//	@Override
//	protected void customizeRegistration(ServletRegistration.Dynamicregistration) {
//		registration.setInitParameter("throwExceptionIFNoHandlerFound", "true");
//	}
	
}
