<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <title>강의페이지</title>

    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/css/npm_tinymce.e9ef03f1787754b19d9f.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/css/MAIN.f2f1f621eea3a455fa44.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-accordion.min.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-switch.min.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-tooltip.min.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/dist/vendor/bulma-tooltip.min.css">
    <link rel="stylesheet" href="https://cdn.inflearn.com/font/font-awesome/css/all.min.css">
    <link rel="stylesheet" href="/res/css/MAIN.2300e926c1f7c59e6cc7.css">
    <link rel="stylesheet" type="text/css" href="/res/css/video-js.min.css"/>
    <script src="/res/js/video.min.js"></script>
    <script src="${pageContext.request.contextPath}/notika/js/vendor/jquery-1.12.4.min.js"></script>
    <script>
        var $j = jQuery.noConflict();
        var videoinfo;
        var vid;
        $j(document).ready(function () {
            vid = videojs("my-video", {
                preload:'auto', muted: true,controls:true,
                sources: [{
                    src: '${continuePlay.FILE_URL}',
                    type: 'video/mp4'
                }]
            },function(){
              this.on('loadedmetadata',function(){
                  this.currentTime(${continuePlay.REPLAY_TIME});
              })
            });
            $j("li[fxd-data='{\"id\":${continuePlay.CLASS_IDENTIFYING_CODE},\"preview\":true}']").addClass("is_now");
            var subname = $j("li[fxd-data='{\"id\":${continuePlay.CLASS_IDENTIFYING_CODE},\"preview\":true}']").find('span.list-item.unit_title').text();

            $j("div.unit_title").find("h1").text(subname);

            $j("video").on("contextmenu", function () {
                return false;
            });
            $j(".list.unit.unit_lecture").on("click", function () {
                var obj = JSON.parse($j(this).attr("fxd-data"));
                location.href = "${pageContext.request.contextPath}/subjectPage/${continuePlay.LECTURE_CODE}/lecturePage/" + obj.id;
            });

            $j("div.right_buttons").on("click",function(event){
                event.stopPropagation();
                location.href="${pageContext.request.contextPath}/subjectPage/${continuePlay.LECTURE_CODE}/eduGoal";
            });

            $j(window).on('unload', function () {
                console.log('unload');
                videoinfo = {
                    "class_identifying_code":${class_identifying_code},
                    "replay_time": vid.currentTime()
                };
                $j.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/subjectPage/${lecture_code}/lecturePage",
                    dataType: 'json',
                    data: JSON.stringify(videoinfo),
                    contentType: 'application/json; charset=utf-8',
                    success: function (resp) {
                        resp.toString();
                    },
                    error: function (err) {
                        err.toString();
                    }
                });
            });

        });
    </script>

</head>

<body id="inflearn" class="lecture"
      fxd-data='{"google":"https://accounts.google.com/o/oauth2/v2/auth?access_type=offline&prompt=consent&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&response_type=code&client_id=887875630717-ror9t8ig4obhvokdij07eoochpqbu5kf.apps.googleusercontent.com&redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Fgoogle","facebook":"https://facebook.com/dialog/oauth?response_type=code&client_id=1101702136522636&redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Ffacebook&scope=email","github":"https://github.com/login/oauth/authorize?response_type=code&client_id=5fd8e44b142806d9cbea&redirect_uri=https%3A%2F%2Fwww.inflearn.com%2Fauth%2Fgithub&scope=user%3Aemail"}'>
<div id="root">
    <main id="main">

        <section class="lecture_container">
            <a class="toggle_left is-hidden-tablet">
                <svg width="16" aria-hidden="true" data-prefix="fal" data-icon="times"
                     class="svg-inline--fa fa-times fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg"
                     viewBox="0 0 320 512">
                    <path fill="currentColor"
                          d="M193.94 256L296.5 153.44l21.15-21.15c3.12-3.12 3.12-8.19 0-11.31l-22.63-22.63c-3.12-3.12-8.19-3.12-11.31 0L160 222.06 36.29 98.34c-3.12-3.12-8.19-3.12-11.31 0L2.34 120.97c-3.12 3.12-3.12 8.19 0 11.31L126.06 256 2.34 379.71c-3.12 3.12-3.12 8.19 0 11.31l22.63 22.63c3.12 3.12 8.19 3.12 11.31 0L160 289.94 262.56 392.5l21.15 21.15c3.12 3.12 8.19 3.12 11.31 0l22.63-22.63c3.12-3.12 3.12-8.19 0-11.31L193.94 256z"></path>
                </svg>
            </a>
            <aside class="lecture_nav lecture_nav_left">
                <div class="lecture_nav_left_header">
                    <h5>${videoList[0].LECTURE_NAME}</h5>
                    <p><span class="is-bold">기간:</span> 무제한</p>
                    <div class="progress_container">
                        <div class="inf_progress">
                            <c:set var="count" value="0"/>

                            <c:forEach items="${completeList}" var="complete">
                                <c:set var="yn" value="${complete}"/>
                                <c:if test="${complete == 'Y'}">
                                    <c:set var="count" value="${count+1}"/>
                                </c:if>
                            </c:forEach>
                            <fmt:formatNumber var="comp_rate" value="${count/videoList.size()*100}" pattern="0.0"/>
                            <label>진도율: ${comp_rate}% | 총 ${videoList.size()}개 강좌중 ${count}개 완료</label>
                            <progress class="progress is-primary" value="${comp_rate}" max="100"></progress>
                        </div>
                    </div>
                </div>
                <div class="curriculum">
                    <ul>
                        <c:set var="credit" value="${videoList[0].LECTURE_CREDIT}"/>
                        <c:set var="start" value="${0}"/>
                        <c:set var="end" value="${credit-1}"/>
                        <c:set var="count" value="${1}"/>
                        <c:forEach var="i" begin="1" end="12">
                            <li class="list unit unit_section   "
                                fxd-data='{"id":${count},"preview":false}'>
                                <span class="list-item unit_title">${i}주차</span>
                            </li>
                            <c:forEach var="j" begin="${start}" end="${end}">
                                <c:set var="count" value="${count+1}"/>
                                <c:choose>
                                    <c:when test="${videoList[j].ABSENCE_YN=='Y'}">
                                        <li class="list unit unit_lecture is_checked" fxd-data='{"id":${videoList[j].CLASS_IDENTIFYING_CODE},"preview":true}'>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="list unit unit_lecture" fxd-data='{"id":${videoList[j].CLASS_IDENTIFYING_CODE},"preview":true}'>
                                    </c:otherwise>

                                </c:choose>
                                <span class="list-item unit_title">${videoList[j].LECTURE_SUBNAME}
                                            <a href="/lecturePage/${videoList[j].CLASS_IDENTIFYING_CODE}"></a></span>
                                <span class="unit_checked icon"><svg width="16" aria-hidden="true" data-prefix="fas"
                                                                     data-icon="check-circle"
                                                                     class="svg-inline--fa fa-check-circle fa-w-16"
                                                                     role="img" xmlns="http://www.w3.org/2000/svg"
                                                                     viewBox="0 0 512 512"><path fill="currentColor"
                                                                                                 d="M504 256c0 136.967-111.033 248-248 248S8 392.967 8 256 119.033 8 256 8s248 111.033 248 248zM227.314 387.314l184-184c6.248-6.248 6.248-16.379 0-22.627l-22.627-22.627c-6.248-6.249-16.379-6.249-22.628 0L216 308.118l-70.059-70.059c-6.248-6.248-16.379-6.248-22.628 0l-22.627 22.627c-6.248 6.248-6.248 16.379 0 22.627l104 104c6.249 6.249 16.379 6.249 22.628.001z"></path></svg></span>
                                </li>
                                <c:if test="${j eq end}">
                                    <c:set var="start" value="${end+1}"/>
                                    <c:set var="end" value="${end+credit}"/>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </ul>
                </div>
            </aside>

            <div class="content_container center">
                <header class="content_header_nav" fxd-data='{"course_id":221292,"unit_id":15533}'>
                    <div class="toggle_left">
                        <a class="button is-outlined is-inverted is-link">
                            <svg width="16" aria-hidden="true" data-prefix="far" data-icon="list-ol"
                                 class="svg-inline--fa fa-list-ol fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 512 512">
                                <path fill="currentColor"
                                      d="M500 124H140c-6.627 0-12-5.373-12-12V80c0-6.627 5.373-12 12-12h360c6.627 0 12 5.373 12 12v32c0 6.627-5.373 12-12 12zm12 148v-32c0-6.627-5.373-12-12-12H140c-6.627 0-12 5.373-12 12v32c0 6.627 5.373 12 12 12h360c6.627 0 12-5.373 12-12zm0 160v-32c0-6.627-5.373-12-12-12H140c-6.627 0-12 5.373-12 12v32c0 6.627 5.373 12 12 12h360c6.627 0 12-5.373 12-12zM3.263 148.428C3.263 155.905 7.18 160 14.836 160h67.293c7.655 0 11.572-4.095 11.572-11.572v-8.901c0-7.477-3.917-11.572-11.572-11.572H66.64V43.572C66.64 35.916 62.547 32 54.891 32H42.785c-6.053 0-9.97 1.602-14.42 5.697L6.646 57.635C1.128 62.798.771 68.673 6.112 74.014l5.518 6.231c5.162 5.519 11.216 5.341 15.666 1.068 1.069-1.068 2.848-3.738 2.848-3.738h.356s-.534 5.34-.534 10.503v39.878h-15.13c-7.656 0-11.573 4.094-11.573 11.572v8.9zm-1.052 160.19c0 7.354 5.078 11.382 12.083 11.382h67.939c7.529 0 11.557-4.028 11.557-11.382v-8.755c0-7.355-4.028-11.382-11.557-11.382H43.184c1.926-10.507 48.679-18.561 48.679-56.909 0-29.067-25.039-39.573-44.476-39.573-21.362 0-33.795 9.981-40.449 18.736-4.378 5.604-2.976 10.857 2.803 15.409l8.579 6.829c5.604 4.553 11.032 2.452 16.111-2.451 2.976-2.801 6.303-3.852 9.455-3.852 3.326 0 9.28 1.576 9.28 8.755 0 12.782-50.955 21.888-50.955 69.165v4.028zM8.28 470.545C15.984 475.272 27.54 480 44.176 480c34.145 0 48.503-22.763 48.503-44.126 0-14.358-9.105-29.767-28.716-34.845l17.509-20.137c3.678-4.377 5.079-8.405 5.079-14.183v-3.327c0-7.355-3.853-11.382-11.382-11.382H16.685c-7.53 0-11.383 3.852-11.383 11.382v8.755c0 7.354 3.853 11.382 11.383 11.382h12.957c8.405 0 12.608-1.051 12.608-1.051v.35s-5.428 5.078-12.257 13.483l-5.604 7.004c-4.028 5.078-5.253 10.156-2.801 14.884l1.05 1.926c2.978 5.779 6.304 7.88 12.258 7.88h4.728c10.33 0 15.934 2.452 15.934 9.106 0 4.728-4.203 8.23-14.358 8.23-4.729 0-9.457-1.051-14.359-3.152-6.479-3.852-11.732-3.502-15.584 3.152l-5.603 9.28c-3.678 6.128-3.153 11.731 2.626 15.934z"></path>
                            </svg>
                        </a>
                    </div>
                    <div class="unit_title">
                        <h1></h1>
                    </div>
                    <div class="right_buttons">
                        <button class="button go_out_course is-outlined is-inverted is-link">
                            <span><i class="fal fa-external-link"></i></span>
                            <span class="is-hidden-touch">나가기</span>
                        </button>
                    </div>
                </header>

                <div class="content unit_body">
                    <div class="note_container" style="padding:0px;">
                        <div class="video-js-box">
                            <video id="my-video" controls preload="auto" class="video-js" src="${video_url}"></video>
                        </div>
                    </div>
                </div>

                <footer class="content_footer_nav navbar">
                    <div class="navbar-item">

                        <button class="button is-link is-inverted is-outlined is_no_border is_completed">
                            <svg width="16" aria-hidden="true" data-prefix="far" data-icon="check"
                                 class="svg-inline--fa fa-check fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg"
                                 viewBox="0 0 512 512">
                                <path fill="currentColor"
                                      d="M435.848 83.466L172.804 346.51l-96.652-96.652c-4.686-4.686-12.284-4.686-16.971 0l-28.284 28.284c-4.686 4.686-4.686 12.284 0 16.971l133.421 133.421c4.686 4.686 12.284 4.686 16.971 0l299.813-299.813c4.686-4.686 4.686-12.284 0-16.971l-28.284-28.284c-4.686-4.686-12.284-4.686-16.97 0z"></path>
                            </svg>
                        </button>
                    </div>
                    <div class="navbar-item">

                        <button class="button is-link is-inverted is-outlined is_no_border next_unit">
                            <svg width="16" aria-hidden="true" data-prefix="far" data-icon="step-forward"
                                 class="svg-inline--fa fa-step-forward fa-w-14" role="img"
                                 xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                <path fill="currentColor"
                                      d="M372 32h-24c-6.6 0-12 5.4-12 12v183L116.5 39.4C95.9 22.3 64 36.6 64 64v384c0 27.4 31.9 41.8 52.5 24.6L336 283.9V468c0 6.6 5.4 12 12 12h24c6.6 0 12-5.4 12-12V44c0-6.6-5.4-12-12-12zM112 413.5V98.4l186.7 157.1-186.7 158z"></path>
                            </svg>
                            다음강좌
                        </button>
                    </div>
                </footer>
            </div>
        </section>
    </main>

    <div class="loading_spinner_container">
        <svg
                class="lds-spinner"
                id="loading_spinner"
                width="200"
                height="200"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                viewBox="0 0 100 100"
                preserveAspectRatio="xMidYMid"
        >
            <g transform="rotate(0 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.9166666666666666s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(30 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.8333333333333334s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(60 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.75s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(90 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.6666666666666666s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(120 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.5833333333333334s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(150 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.5s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(180 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.4166666666666667s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(210 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.3333333333333333s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(240 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.25s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(270 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.16666666666666666s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(300 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="-0.08333333333333333s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
            <g transform="rotate(330 50 50)">
                <rect x="47" y="24" rx="9.4" ry="4.8" width="6" height="12" fill="#28292f">
                    <animate
                            attributeName="opacity"
                            values="1;0"
                            keyTimes="0;1"
                            dur="1s"
                            begin="0s"
                            repeatCount="indefinite"
                    ></animate>
                </rect>
            </g>
        </svg>
    </div>
</div>
<script type="module" src="https://cdn.inflearn.com/dist/js/MAIN.f2f1f621eea3a455fa44.js"></script>
<script type="module" src="https://cdn.inflearn.com/dist/js/npm_date-fns.798991ecfefe7fcfd2b1.js"></script>
<script type="module" src="https://cdn.inflearn.com/dist/js/npm_sortable.ebb1496eb1c623bab6d1.js"></script>
<script type="module" src="https://cdn.inflearn.com/dist/js/npm_tinymce.e9ef03f1787754b19d9f.js"></script>
<!-- Dable 스크립트 시작 -->
<script>
    (function (d, a, b, l, e, _) {
        d[b] =
            d[b] ||
            function () {
                (d[b].q = d[b].q || []).push(arguments);
            };
        e = a.createElement(l);
        e.async = 1;
        e.charset = 'utf-8';
        e.src = '//static.dable.io/dist/plugin.min.js';
        _ = a.getElementsByTagName(l)[0];
        _.parentNode.insertBefore(e, _);
    })(window, document, 'dable', 'script');
    dable('setService', 'inflearn.com');
    dable('sendLog');
</script>
<!-- Dable 스크립트 종료 -->
<script type="module" src="https://cdn.inflearn.com/dist/js/LECTURE_ACTION.027c73dc1c73b862116a.js"></script>

<!-- Hotjar Tracking Code for www.inflearn.com -->
<script>
    (function (h, o, t, j, a, r) {
        h.hj = h.hj || function () {
            (h.hj.q = h.hj.q || []).push(arguments)
        };
        h._hjSettings = {hjid: 1070825, hjsv: 6};
        a = o.getElementsByTagName('head')[0];
        r = o.createElement('script');
        r.async = 1;
        r.src = t + h._hjSettings.hjid + j + h._hjSettings.hjsv;
        a.appendChild(r);
    })(window, document, 'https://static.hotjar.com/c/hotjar-', '.js?sv=');
</script>
<script type="text/javascript" defer="defer" src="https://extend.vimeocdn.com/ga/13628830.js"></script>
</body>
</html>
