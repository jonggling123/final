<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page language="java" %>
<script type="text/javascript">
	$(function() {
		 var chatTime = moment().format("MM/DD hh:mm");
		 $('<li class="clearfix odd"><div class="chat-avatar"><i>' + chatTime + '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>대덕인재대학교</i><p>' + "안녕하세요.대덕인재대학교 ChatBot시스템 입니다." + '</p></div></div></li>').appendTo('ul.conversation-list');
	});
</script>
<script type="text/javascript">
	$(function(){
		echoTest();
	});
	function writeMessage(message){ 
		var num = $('#webSocketAlertNo').text();
		if(num!=""){
			$(num).text(parseInt(num)+1);
		}else{
			$(num).text("1");
		}
	}
	
	var sockJS;
	function echoTest(){
		if(window.WebSocket){
			console.log("websocket 지원!");
			
			sockJS = new WebSocket("wss://localhost/projecttemplate/alert");
			sockJS.onopen = function(event){
				writeMessage(event.target.url + "과 연결 수립");
			};
			sockJS.onclose = function(closeEvt){
				writeMessage("연결 종료, 종료코드 : " + closeEvt.code
					+ ", 종료사유 : " + closeEvt.reason);
			};
			
			sockJS.onerror = function(errorEvt){
				console.log("에러 발생, 에러코드는 종료 후 종료코드 확인.");
			};
			
			sockJS.onmessage = function(messageEvt){
				var message = messageEvt.data;
				console.log("수신 메세지 타입 : " + typeof message);
				writeMessage(message);
			};
			
		}else{
				console.log("websocket 미지원...");
		}
	}
</script>

<input id ="userName" type="hidden" value="${user.user_name}"></input>
<input id="contextPath" type="hidden" value="${pageContext.request.contextPath}"></input>
<div class="header-top-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="logo-area">
                    <a href="${pageContext.request.contextPath }/chooseMain"><img src="${pageContext.request.contextPath}/notika/img/logo/logo.png" alt="" /></a>
                </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="header-top-menu">
                    <ul class="nav navbar-nav notika-top-nav">
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-search"></i></span></a>
                            <div role="menu" class="dropdown-menu search-dd animated flipInX">
                                <div class="search-input">
                                    <i class="notika-icon notika-left-arrow"></i>
                                    <input type="text" />
                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-mail"></i></span></a>
                            <div role="menu" class="dropdown-menu message-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>Messages</h2>
                                </div>
                                <div class="hd-message-info">
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/1.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>David Belle</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/2.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>Jonathan Morris</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/4.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>Fredric Mitchell</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/1.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>David Belle</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/2.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>Glenn Jecobs</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
<!--                         알림 -->
                        <li class="nav-item nc-al"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-alarm"></i></span><div class="spinner4 spinner-4"></div><div class="ntd-ctn"><span>3</span></div></a>
                            <div role="menu" class="dropdown-menu message-dd notification-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>알림</h2>
                                </div>
                                <div class="hd-message-info">
                                    <a href="#">
                                        <div class="hd-message-sn">
                                            <div class="hd-message-img">
                                                <img src="${pageContext.request.contextPath}/notika/img/post/1.jpg" alt="" />
                                            </div>
                                            <div class="hd-mg-ctn">
                                                <h3>David Belle</h3>
                                                <p>Cum sociis natoque penatibus et magnis dis parturient montes</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        
                        <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                        	<span><i class="notika-icon notika-menus"></i>
                        	</span><div class="spinner4 spinner-4"></div><div class="ntd-ctn">
									<span id="webSocketAlertNo"></span>
								</div></a>
                            <div role="menu" class="dropdown-menu message-dd task-dd animated zoomIn">
                                <div class="hd-mg-tt">
                                    <h2>알림</h2>
                                </div>
                                <div class="hd-message-info hd-task-info">
                                    <div class="skill">
                                        <div class="progress">
                                            <div class="lead-content">
                                                <p>HTML5 Validation Report</p>
                                            </div>
                                            <div class="progress-bar wow fadeInLeft" data-progress="95%" style="width: 95%;" data-wow-duration="1.5s" data-wow-delay="1.2s"> <span>95%</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="hd-mg-va">
                                    <a href="#">View All</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle"><span><i class="notika-icon notika-chat"></i></span></a>
                            <div role="menu" class="dropdown-menu message-dd chat-dd animated zoomIn">
                             <div class="notika-chat-list notika-shadow mg-t-30 tb-res-ds-n dk-res-ds">
                        <div class="realtime-ctn">
                            <div class="realtime-title">
                                <h2>Chat Box</h2>
                            </div>
                        </div>
                        <div class="card-box">
                            <div class="chat-conversation">
                                <div class="widgets-chat-scrollbar">
                                    <ul class="conversation-list">
                                    </ul>
                                </div>
                                <div class="chat-widget-input">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12 col-sm-12 col-xs-12 chat-inputbar">
                                            <div class="form-group todo-flex">
                                                <div class="nk-int-st">
                                                    <input type="text" class="form-control chat-input" placeholder="Enter your text">
                                                </div>
                                                <div class="chat-send">
                                                    <button type="submit" class="btn btn-md btn-primary btn-block notika-chat-btn">Send</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            </div>
                        </li>
                        <li class="nav-item">
                        	<a href="${pageContext.request.contextPath }/logout" aria-expanded="false" class="nav-link">로그아웃</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
