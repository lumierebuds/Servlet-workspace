package com.kh.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * DispatcherServlet
 *  - 스프링 프레임워크에서 관리하는 단 하나뿐인 서블릿
 *  - 클라이언트의 "모든" 요청을 가장 먼저 받은 후, 적절한 핸들러(Controller)를 찾아서 요청을 Dispatch(위임)
 *    하고 최종적으로 응답내용을 반환해주는 역할을 한다.
 *  - 클라이언트의 어떤 url이든 다 받기위해 urlPattern을 /*로 정의함.
 *  
 * DispatcherServlet의 핵심 구성 요소 
 * 
 * 1. HandlerMapping
 *  - urlPattern과 그에 매칭되는 핸들러(Controller)의 정보를 담고 있는 객체
 *    ex) /student/insertStudent -> InsertStudentController
 *        /student/insertStudentMap -> InsertStudentMapController
 * 
 *  - Servlet객체가 초기화될때 등록가능한 핸들러정보들을 읽어들인 후 urlPattern과 핸들러를 key:value형태로 보관
 *  	(init 메서드로 초기화될때 등록) 
 * 
 * 2. ViewResolver 
 *  - 핸들러의 반환값(viewName)을 기반으로 클라이언트에게 응답할 view페이지를 선택하는 객체
 *    ex) 컨트롤러에서 "notice/list"를 반환하면 "/WEB-INF/views/"+ viewName+".jsp"
 * 
 * 
 */

@WebServlet("*.do") // 끝이 .do로 끝나는 경로
public class DispatcherServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Map<String, AbstractController> handlerMapping = new HashMap<>();

    public DispatcherServlet() {
        super();
    }


	@Override
	public void init(ServletConfig config) throws ServletException {
		//
		Properties prop = new Properties();

		String fileName = DispatcherServlet.class.getResource("/resources/handlerMapping-info.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// key(url-pattern) : value(controller)
		Set<String> keys = prop.stringPropertyNames(); // url 패턴에 해당하는 "키"
		for (String key : keys) {
			String value = prop.getProperty(key); // url 패턴을 처리할 수 있는 클래스명인 "값"
			// Controller 객체화

			// 클래스 객체 : 해당 클래스의 구성정보(생성자, 메서드, 필드 등등..)를 모두 가진 객체
			Class claszz;
			try {
				claszz = Class.forName(value);
				Constructor con = claszz.getDeclaredConstructor(); // 기본 생성자
				con.setAccessible(true); // 기본 생성자에 접근할 수 있게 만들었음
				AbstractController controller = (AbstractController) con.newInstance(); // 객체생성
				// 객체가 생성되었을땐 Object 타입으로 반환되어서 AbstractController로 다운 캐스팅을 해준다.
				// 이를 핸들러매핑 객체에 추가해주도록 한다.

				handlerMapping.put(key, controller);

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			} catch (SecurityException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}

		}
		System.out.println("init::" + handlerMapping);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			// 클라이언트의 요청주소 가져오기
			String uri = request.getRequestURI(); // "/mybatis/student/insertStudent"


			int beginIndex = request.getContextPath().length(); // 애플리케이션의 컨텍스트 경로 길이 - 이를 기준으로 잘라준다.
			String url = uri.substring(beginIndex); // "/student/insertStudent"


			// url과 매핑되는 controller 객체 호출

			AbstractController controller = handlerMapping.get(url);

			if (controller == null) {
				System.out.println(url);
				System.out.println(url + "에 해당하는 controller가 없습니다.");
			}

			String method = request.getMethod(); // GET/POST - 요청메서드 
			String viewName = null;
			switch (method) {
			case "GET":
				viewName = controller.doGet(request, response);
				break;
			case "POST":
				viewName = controller.doPost(request, response);
				break;
			}
			
			// jsp forwarding 혹은 redirect 처리 
			if(viewName != null) {
				if (viewName.startsWith("redirect:")) {
					// redirect
					String location = request.getContextPath() + viewName.replace("redirect:", "");
					response.sendRedirect(location);
				} else {
					final String prefix = "/WEB-INF/views/"; // 접두어 
					final String suffix = ".jsp"; // 접미어 (forwarding 하기 위한 문자열을 만들기)
					request.getRequestDispatcher(prefix + viewName + suffix).forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// POST 요청이 들어올때 서블릿에서 정의한 doGet 메서드가 호출되도록 한다.
		// 그러면 "String method = request.getMethod(); // GET/POST - 요청메서드 " 해당 코드에서
		// 반환되는 메서드가 POST가 출력되게한다.
		doGet(request, response);
	}

}
