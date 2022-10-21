package org.zerock.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@EnableWebMvc
@ComponentScan(basePackages = {"org.zerock.controller", "org.zerock.exception"})
public class ServletConfig implements WebMvcConfigurer{

	@Bean(name="multipartResolver") public CommonsMultipartResolver getResolver() throws Exception{ 
		CommonsMultipartResolver resolver = new CommonsMultipartResolver(); 
	//10MB 
	resolver.setMaxUploadSize(1024*1024*10); 
	//2MB 
	resolver.setMaxUploadSizePerFile(1024*1024*2); 
	//1MB 
	resolver.setMaxInMemorySize(1024*1024); 
	//temp upload 
	resolver.setUploadTempDir(new FileSystemResource("C:\\upload\\temp")); 
	resolver.setDefaultEncoding("utf-8"); 
	return resolver;
	}

}
