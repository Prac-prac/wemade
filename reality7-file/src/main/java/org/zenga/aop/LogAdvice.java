package org.zenga.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	@Before("execution(* org.zenga.service.TryAopService*.*(..))")
	public void logBefore() {
		log.info("====logBefore===== ");
	}
	
	@Before("execution(* org.zenga.service.TryAopService*.doAdd(String, String)) && args(str1, str2)")
	public void logBeforeWithParam(String str1, String str2) {
		log.info("str1: "+str1 +", str2: "+str2);
	}
	
	//에러 발생 시 예외 로그 찍음
	@AfterThrowing(pointcut = "execution(* org.zenga.service.TryAopService*.*(..))", throwing = "exception")
	public void logException(Exception exception) {
		log.info("exception: "+exception);
	}
	
	@Around("execution(* org.zenga.service.TryAopService*.*(..))")
	public Object logTime(ProceedingJoinPoint pjp) {
		long start = System.currentTimeMillis();
		
		Object result = null;
		try {
			result = pjp.proceed();
		} catch(Throwable e) {
			e.printStackTrace();
		}
		long end = System.currentTimeMillis();
	
		log.info("TIME: " + (end-start));
		log.info("result: "+result);
		return result;
	}
	
	
}
