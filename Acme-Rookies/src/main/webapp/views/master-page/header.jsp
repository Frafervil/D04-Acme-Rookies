<%--
 * header.jsp
 *
 * Copyright (C) 2019 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="jstl"  uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<a href="#"><img width="300px" src="${bannerWelcome }" alt="Acme Rookies Co., Inc." /></a>
</div>


<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="administrator/administrator/register.do"><spring:message code="master.page.administrator.register"/></a></li>
					<li><a href="auditor/administrator/register.do"><spring:message code="master.page.auditor.register"/></a></li>						
					<li><a href="customisation/administrator/display.do"><spring:message code="master.page.administrator.customisation" /></a></li>	
					<li><a href="dashboard/administrator/display.do"><spring:message code="master.page.administrator.dashboard" /></a></li>		
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('ROOKIE')">
			<li><a class="fNiv"><spring:message	code="master.page.rookie" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="application/rookie/list.do"><spring:message code="master.page.application.list" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>
		</security:authorize>

		<security:authorize access="hasRole('COMPANY')">
			<li><a class="fNiv"><spring:message	code="master.page.company" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="position/company/list.do"><spring:message code="master.page.company.positions" /></a></li>
					<li><a href="problem/company/list.do"><spring:message code="master.page.company.problems" /></a></li>
					<li><a href="application/company/list.do"><spring:message code="master.page.company.applications" /></a></li>										
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>
		</security:authorize>
		<security:authorize access="hasRole('AUDITOR')">
			<li><a class="fNiv"><spring:message	code="master.page.auditor" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="audit/auditor/list.do"><spring:message code="master.page.auditor.audits" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>
		</security:authorize>		
		
		<security:authorize access="hasRole('PROVIDER')">
			<li><a class="fNiv"><spring:message	code="master.page.provider" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="item/provider/list.do"><spring:message code="master.page.provider.items" /></a></li>										
				</ul>
			</li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv"><spring:message
						code="master.page.companies" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="company/list.do"><spring:message
								code="master.page.customer.list.companies" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message
						code="master.page.positions" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="position/list.do"><spring:message
								code="master.page.customer.list.positions" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message
						code="master.page.providers" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="provider/list.do"><spring:message
								code="master.page.customer.list.providers" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message
						code="master.page.items" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="item/list.do"><spring:message
								code="master.page.customer.list.items" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a>
			<ul>
					<li class="arrow"></li>
					<li><a href="rookie/register.do"><spring:message
								code="master.page.register.rookie" /></a></li>
					<li><a href="company/register.do"><spring:message
								code="master.page.register.company" /></a></li>
					<li><a href="provider/register.do"><spring:message
								code="master.page.register.provider" /></a></li>
				</ul></li>
			<li><a class="fNiv"><spring:message code="master.page.terms" /></a>
				<ul>
					<li class="arrow"></li>
					<jstl:if test="${cookie['language'].getValue()=='en'}">
					<li><a href="terms/englishTerms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
					<jstl:if test="${cookie['language'].getValue()=='es'}">
					<li><a href="terms/terms.do"><spring:message
								code="master.page.terms" /></a></li>
					</jstl:if>
				</ul>
			</li>	
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
		<li><a class="fNiv"><spring:message
						code="master.page.companies" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="company/list.do"><spring:message
								code="master.page.customer.list.companies" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message
						code="master.page.positions" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="position/list.do"><spring:message
								code="master.page.customer.list.positions" /></a></li>
				</ul>
			</li>
			<li><a class="fNiv"><spring:message
						code="master.page.providers" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="provider/list.do"><spring:message
								code="master.page.customer.list.providers" /></a></li>
				</ul>
			</li>
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					<security:authorize access="hasRole('COMPANY')">
					<li><a href="company/display.do"><spring:message code="master.page.company.display" /></a></li>
					</security:authorize>
					<security:authorize access="hasRole('ROOKIE')">
					<li><a href="rookie/display.do"><spring:message code="master.page.rookie.display" /></a></li>
					</security:authorize>
					<security:authorize access="hasRole('PROVIDER')">
					<li><a href="provider/display.do"><spring:message code="master.page.provider.display" /></a></li>
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">
					<li><a href="administrator/viewProfile.do"><spring:message code="master.page.administrator.viewProfile" /></a></li>
					</security:authorize>
					<security:authorize access="hasRole('AUDITOR')">
					<li><a href="auditor/viewProfile.do"><spring:message code="master.page.auditor.viewProfile" /></a></li>
					</security:authorize>
					<li><a href="message/actor/list.do"><spring:message code="master.page.profile.messages" /></a></li>					
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

