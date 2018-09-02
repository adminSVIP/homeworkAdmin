<%@page import="entity.Operator" isELIgnored="false"%>
  <%@page pageEncoding="utf-8" %>
    <!DOCTYPE html>
<html lang="en">
    <% 
	Operator user = (Operator)session.getAttribute("user");
	int power = user.getPower();

%>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="/static/images/favicon.ico" type="image/ico" />

  <title>Gentelella Alela! | </title>

  <!-- Bootstrap -->
  <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="vendors/nprogress/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="vendors/iCheck/skins/flat/green.css" rel="stylesheet">

  <!-- bootstrap-progressbar -->
  <link href="vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
  <!-- JQVMap -->
  <link href="vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
  <!-- bootstrap-daterangepicker -->
  <link href="vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="build/css/custom.min.css" rel="stylesheet">
  <link rel="stylesheet" href="static/css/layer.css">
  <link rel="stylesheet" href="static/css/dropzone.css">
  <link rel="stylesheet" href="static/css/basic.css">
  <script src="static/js/angular.min.js"></script>
  <script src="static/js/angular-route.js"></script>
  <script type="text/javascript" charset="utf-8" src="uEditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="uEditor/ueditor.all.min.js"> </script>
  <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
  <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
  <script type="text/javascript" charset="utf-8" src="uEditor/lang/zh-cn/zh-cn.js"></script>


  <style>
    #editor {
      width: 100% !important;
      height: 100% !important;
    }

    /* #editor .edui-editor-iframeholder{
            height: 400px !important;
          } */

    .pointer,
    .pagination a {
      cursor: pointer;
    }
  </style>

</head>

<body class="nav-md">
  <div class="container body" ng-app="jdShop">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title">
              <i class="fa fa-paw"></i>
              <span>Gentelella Alela!</span>
            </a>
          </div>

          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="static/images/img.jpg" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
              <span>欢迎,</span>
              <h2>${sessionScope.user.nike}</h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <ul class="nav side-menu">
                <% if(power>=2){ %>
                <li>
                  <a class="a_admin" href="#operator_index">
                    <i class="fa fa-laptop"></i>管理员管理</a>
                </li>
                <%} %>
                <li>
                  <a class="a_admin" href="#product_index">
                    <i class="fa fa-laptop"></i>商品管理</a>
                </li>
                <li>
                  <a class="a_admin" href="#shopcar_index">
                    <i class="fa fa-laptop"></i>购物车</a>
                </li>
                <li>
                  <a class="a_admin" href="#orders_index">
                    <i class="fa fa-laptop"></i>订单管理</a>
                </li>
              </ul>
              <!-- <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">General Form</a></li>
                      <li><a href="form_advanced.html">Advanced Components</a></li>
                      <li><a href="form_validation.html">Form Validation</a></li>
                      <li><a href="form_wizards.html">Form Wizard</a></li>
                      <li><a href="form_upload.html">Form Upload</a></li>
                      <li><a href="form_buttons.html">Form Buttons</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.html">General Elements</a></li>
                      <li><a href="media_gallery.html">Media Gallery</a></li>
                      <li><a href="typography.html">Typography</a></li>
                      <li><a href="icons.html">Icons</a></li>
                      <li><a href="glyphicons.html">Glyphicons</a></li>
                      <li><a href="widgets.html">Widgets</a></li>
                      <li><a href="invoice.html">Invoice</a></li>
                      <li><a href="inbox.html">Inbox</a></li>
                      <li><a href="calendar.html">Calendar</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li>
                </ul> -->
            </div>


          </div>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
              <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
              <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="退出登陆" href="Logout">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
          </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <nav>
            <div class="nav toggle">
              <a id="menu_toggle">
                <i class="fa fa-bars"></i>
              </a>
            </div>

            <ul class="nav navbar-nav navbar-right">
              <li class="">
                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                  <img src="static/images/img.jpg" alt="">${sessionScope.user.nike}
                  <span class=" fa fa-angle-down"></span>
                </a>
                <ul class="dropdown-menu dropdown-usermenu pull-right">
                  <li>
                    <a href="javascript:;"> Profile</a>
                  </li>
                  <li>
                    <a href="javascript:;">
                      <span class="badge bg-red pull-right">50%</span>
                      <span>Settings</span>
                    </a>
                  </li>
                  <li>
                    <a href="javascript:;">Help</a>
                  </li>
                  <li>
                    <a href="Logout">
                      <i class="fa fa-sign-out pull-right"></i>退出登陆</a>
                  </li>
                </ul>
              </li>

              <li role="presentation" class="dropdown">
                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                  <i class="fa fa-envelope-o"></i>
                  <span class="badge bg-green">6</span>
                </a>
                <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                  <li>
                    <a>
                      <span class="image">
                        <img src="static/images/img.jpg" alt="Profile Image" />
                      </span>
                      <span>
                        <span>${sessionScope.user.nike}</span>
                        <span class="time">3 mins ago</span>
                      </span>
                      <span class="message">
                        Film festivals used to be do-or-die moments for movie makers. They were where...
                      </span>
                    </a>
                  </li>
                  
                  <li>
                    <div class="text-center">
                      <a>
                        <strong>See All Alerts</strong>
                        <i class="fa fa-angle-right"></i>
                      </a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      <div class="right_col" style="min-height: 100%" role="main" ng-view>

      </div>
      <!-- /page content -->

      <!-- footer content -->
      <footer>
        <div class="pull-right">
          Gentelella - Bootstrap Admin Template by
          <a href="https://colorlib.com">Colorlib</a>
        </div>
        <div class="clearfix"></div>
      </footer>
      <!-- /footer content -->
    </div>
  </div>

  <!-- jQuery -->
  <script src="vendors/jquery/dist/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
  <!-- FastClick -->
  <script src="vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="vendors/nprogress/nprogress.js"></script>
  <!-- Chart.js -->
  <script src="vendors/Chart.js/dist/Chart.min.js"></script>
  <!-- gauge.js -->
  <script src="vendors/gauge.js/dist/gauge.min.js"></script>
  <!-- bootstrap-progressbar -->
  <script src="vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
  <!-- iCheck -->
  <script src="vendors/iCheck/icheck.min.js"></script>
  <!-- Skycons -->
  <script src="vendors/skycons/skycons.js"></script>
  <!-- Flot -->
  <script src="vendors/Flot/jquery.flot.js"></script>
  <script src="vendors/Flot/jquery.flot.pie.js"></script>
  <script src="vendors/Flot/jquery.flot.time.js"></script>
  <script src="vendors/Flot/jquery.flot.stack.js"></script>
  <script src="vendors/Flot/jquery.flot.resize.js"></script>
  <!-- Flot plugins -->
  <script src="vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
  <script src="vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
  <script src="vendors/flot.curvedlines/curvedLines.js"></script>
  <!-- DateJS -->
  <script src="vendors/DateJS/build/date.js"></script>
  <!-- JQVMap -->
  <script src="vendors/jqvmap/dist/jquery.vmap.js"></script>
  <script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
  <script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="vendors/moment/min/moment.min.js"></script>
  <script src="vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
  
  <script src="vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

  <script src="vendors/fastclick/lib/fastclick.js"></script>
  <!-- NProgress -->
  <script src="vendors/nprogress/nprogress.js"></script>
  <!-- Dropzone.js -->
  <script src="vendors/dropzone/dist/min/dropzone.min.js"></script>

  <!-- Custom Theme Scripts -->
  <script src="build/js/custom.min.js"></script>

  <script src="static/layui/layui.js"></script>

  <script>
    
    $.fn.serializeObject = function () {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function () {
        if (o[this.name] !== undefined) {
          if (!o[this.name].push) {
            o[this.name] = [o[this.name]];
          }
          o[this.name].push(this.value || '');
        } else {
          o[this.name] = this.value || '';
        }
      });
      return o;
    };
    var instances= [];
    var jdShop = angular.module("jdShop", ["ngRoute"]);
    jdShop.config(['$routeProvider', function ($routeProvider) {
      $routeProvider
        .when('/operator_index', {
          templateUrl: "operator/index.jsp",
          controller: 'operatorIndexController'
        })
        <% if (power >= 2) { %>
        .when('/', {
          templateUrl: "operator/index.jsp",
          controller: 'operatorIndexController'
        })
        <%} else {%>
        .when('/', {
          templateUrl: "product/show.jsp",
          controller: 'productIndexController'
        })
        <%}%>
        .when('/product_index', {
          templateUrl: "product/show.jsp",
          controller: 'productIndexController'
        })
        .when('/shopcar_index', {
          templateUrl: "shopCar/index.jsp",
          controller: 'shopcarIndexController'
        })
        .when('/orders_index', {
          templateUrl: "orders/index.jsp",
          controller: 'ordersIndexController'
        });
    }]);
    jdShop.config(['$httpProvider', function($httpProvider) {
      $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
    }])


    jdShop.controller("operatorIndexController", ["$scope", "$http", "$compile", function ($scope, $http, $compile) {
      $scope.operators;
      $scope.queryType;
      $scope.status;
      $scope.currPage = 1;
      $scope.allPage;
      $scope.currOperator = null;
      $scope.getOperators = function (pageno) {
        if (pageno != undefined) {
          pageno = "?pageno=" + pageno;
        } else {
          pageno = "";
        }
        $http({
          method: "post",
          // data: "{\"pageno\":\"1\"}",
          url: "operator/select" + pageno
        }).success(function (data) {
          $scope.operators = data.list;
          $scope.allPage = data.allRows % 6 == 0 ? data.allRows / 6 : parseInt(data.allRows / 6) + 1;
        });
      }
      $scope.getStatus = function () {
       
        $http({
          method: "post",
          data: "",
          url: "operator/status"
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.status = data;
        });
      }
      $scope.show = function (width, height, title, url) {
        layui.use('layer', function () {
          var layer = layui.layer;
          layer.open({
            type: 1 //PageÃ¥Â±ÂÃ§Â±Â»Ã¥ÂÂ
            , area: [width + 'px', height + 'px']
            , title: title
            , shade: 0 //Ã©ÂÂ®Ã§Â½Â©Ã©ÂÂÃ¦ÂÂÃ¥ÂºÂ¦
            , offset: 't'
            , maxmin: true //Ã¥ÂÂÃ¨Â®Â¸Ã¥ÂÂ¨Ã¥Â±ÂÃ¦ÂÂÃ¥Â°ÂÃ¥ÂÂ
            , anim: -1 //0-6Ã§ÂÂÃ¥ÂÂ¨Ã§ÂÂ»Ã¥Â½Â¢Ã¥Â¼ÂÃ¯Â¼Â-1Ã¤Â¸ÂÃ¥Â¼ÂÃ¥ÂÂ¯
            , content: ""
            , cancel: function (layero, index) {
              $(layero[0]).remove();
            }
            , success: function (layero, index) {
              // console.log(layero);
              $http({
                method: 'get',
                url: url,
              }).
                success(function (data) {
                  if(data.state=="false"){
                    window.location.href='login.html';
                  }
                  var linkFn = $compile(data);
                  var element = linkFn($scope);
                  $scope.element = element;
                  var layerContent = $(layero[0]).find(".layui-layer-content");
                  layerContent.html($scope.element);
                  if ($scope.currOperator != null) {
                    $(".input_status option").each(function () {
                      if ($(this).val() == $scope.currOperator.status) {
                        $(this).prop("selected", "selected")
                      }
                    });
                    $(".input_power option").each(function () {
                      if ($(this).val() == $scope.currOperator.power) {
                        $(this).prop("selected", "selected")
                      }
                    });
                    $("#gender input[name='sex']").each(function () {
                      if ($(this).val() == $scope.currOperator.sex) {
                        $(this).prop("selected", "selected");
                        $(this).parent().addClass("active");
                      }
                    });

                  }
                })
            }

          });
        });
      }
      $scope.addOperator = function () {
        $scope.currOperator = null;
        $scope.queryType = "insert";
        $scope.show(500, 580, "æ·»å ç®¡çå", 'operator/addForm.html');
      }
      $scope.alterOperator = function (o) {
        $scope.currOperator = o;
        $scope.queryType = "update";
        $scope.show(500, 580, "ç¼è¾ç®¡çå", 'operator/addForm.html');
      }
      $scope.confrim = function () {
        var sex = $("input[name='sex']").val();
        if (sex == "") {
          alert("æå¥å¤±è´¥");
          return;
        }
        // var formData = $(".operatorForm").serializeObject();
        var formData = JSON.stringify($(".operatorForm").serializeObject());

        $.ajax({
          type: "post",
          url: "operator/" + $scope.queryType,
          contentType: "application/json",
          dataType: "json",
          data: formData,
          success: function (data) {
            if(data.state=="false"){
              window.location.href='login.html';
            }
            if (data.rs > 0) {
              $(".layui-layer-page").remove();
              $scope.getOperators();
            } else {
              alert("æå¥å¤±è´¥");
            }
          },
          error: function (data) {
            if(data.state=="false"){
              window.location.href='login.html';
            }
            console.log(data);
          }

        })
      }
      $scope.search = function () {
        var formData = JSON.stringify($(".searchForm").serializeObject());
        $scope.currPage = 1;
        $(".pagination .active").removeClass("active");
        $(".pagination .previous").next().addClass("active");

        $http({
          method: "post",
          data: formData,
          url: "operator/select"
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.operators = data.list;
          $scope.allPage = data.allRows % 6 == 0 ? data.allRows / 6 : parseInt(data.allRows / 6) + 1;
          $(".input_where").val("");
        });
      }
      $scope.next = function () {
        if ((parseInt($scope.currPage) + 1) <= $scope.allPage) {
          var active = $(".pagination .active");
          $scope.currPage = $scope.currPage + 1;
          $scope.getOperators($scope.currPage);
          var nextBtn = $(".pagination .next");
          var cmaxPage = nextBtn.prev().find("a").html();
          if (cmaxPage < $scope.allPage) {
            $(".pagination li a").each(function () {
              var content = $(this).html();
              if (content == "上一页" || content == "下一页") return true;
              $(this).html(parseInt($(this).html()) + 1);
            })
          }
          if (active.next().find("a").html() == "下一页") return;
          active.removeClass("active");
          active.next().addClass("active");

        }
      }
      $scope.prev = function () {
        if (($scope.currPage - 1) >= 1) {
          var active = $(".pagination .active");
          $scope.currPage = $scope.currPage - 1;
          $scope.getOperators($scope.currPage);
          var prevBtn = $(".pagination .previous");
          var cminPage = prevBtn.next().find("a").html();
          if (cminPage > 1) {
            $(".pagination li a").each(function () {
              var content = $(this).html();
              if (content == "上一页" || content == "下一页") return true;
              $(this).html(parseInt($(this).html()) - 1);
            })
          }
          if (active.prev().find("a").html() == "上一页") return;
          active.removeClass("active");
          active.prev().addClass("active");
        }
      }
      $scope.pageBtn = function (event) {
        $(event.target).parent().siblings(".active").removeClass("active");
        $(event.target).parent().addClass("active");
        $scope.currPage = $(event.target).html();
        $scope.getOperators($scope.currPage);
        var prevBtn = $(".pagination .previous");
        var cminPage = prevBtn.next().find("a").html();
        if (cminPage > 2) {
          console.log("-2");
          $(".pagination li a").each(function () {
            var content = $(this).html();
            if (content == "下一页" || content == "上一页") return true;
            $(this).html(parseInt($(this).html()) - 2);
          })
        }
        var nextBtn = $(".pagination .next");
        var cmaxPage = nextBtn.prev().find("a").html();
        if (cmaxPage < ($scope.allPage - 1)) {
          console.log("+2");
          $(".pagination li a").each(function () {
            var content = $(this).html();
            if (content == "下一页" || content == "上一页") return true;
            $(this).html(parseInt($(this).html()) + 2);
          })
        }
      }
      $scope.getOperators();
      $scope.getStatus();

    }])

    jdShop.controller("productIndexController", ["$scope", "$http", "$compile", function ($scope, $http, $compile) {
      $scope.products;
      $scope.currPage = 1;
      $scope.allPage;
      $scope.currProducts = null;
      $scope.pStatuses;

      $scope.pqueryType;
      $scope.getPStatus = function () {
        $http({
          method: "post",
          url: "product/status"
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.pStatuses = data;
        })
      }
      $scope.getProducts = function (pageno) {
        if (pageno != undefined) {
          pageno = "?pageno=" + pageno;
        } else {
          pageno = "";
        }
        $http({
          method: "post",
          url: "product/select" + pageno
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.products = data.list;
          $scope.allPage = data.allRows % 6 == 0 ? data.allRows / 6 : parseInt(data.allRows / 6) + 1;
        });
      }
      $scope.show = function (width, height, title, url) {
        layui.use('layer', function () {
          var layer = layui.layer;
          layer.open({
            type: 1 //PageÃ¥Â±ÂÃ§Â±Â»Ã¥ÂÂ
            , area: [width + 'px', height + 'px']
            , title: title
            , shade: 0 //Ã©ÂÂ®Ã§Â½Â©Ã©ÂÂÃ¦ÂÂÃ¥ÂºÂ¦
            , offset: 't'
            , maxmin: true //Ã¥ÂÂÃ¨Â®Â¸Ã¥ÂÂ¨Ã¥Â±ÂÃ¦ÂÂÃ¥Â°ÂÃ¥ÂÂ
            , anim: -1 //0-6Ã§ÂÂÃ¥ÂÂ¨Ã§ÂÂ»Ã¥Â½Â¢Ã¥Â¼ÂÃ¯Â¼Â-1Ã¤Â¸ÂÃ¥Â¼ÂÃ¥ÂÂ¯
            , content: ""
            , cancel: function (layero, index) {
              $(layero[0]).remove();
            }
            , success: function (layero, index) {
              // console.log(layero);
              $http({
                method: 'get',
                url: url,
              }).
                success(function (data) {
                  if(data.state=="false"){
                    window.location.href='login.html';
                  }
                  var linkFn = $compile(data);
                  var element = linkFn($scope);
                  $scope.element = element;
                  var layerContent = $(layero[0]).find(".layui-layer-content");
                  layerContent.html($scope.element);
                  // dropZone
                  $(".layui-layer .x_content .dr").append("<form action='uploadPic' class='dropzone col-md-4  pull-right'  id='myForm'></form>");

                  $("#myForm").dropzone({
                    url: "uploadPic",
                    maxFiles: 4,//Ã¦ÂÂÃ¥Â¤ÂÃ¤Â¸ÂÃ¤Â¼Â Ã¦ÂÂÃ¤Â»Â¶Ã¦ÂÂ°
                    paramName: "noteImg",//Ã¥ÂÂÃ¦ÂÂ°
                    dictMaxFilesExceeded: "dictMaxFilesExceeded",
                    dictDefaultMessage: 'dictDefaultMessage',
                    dictCancelUpload: "dictCancelUpload",
                    addRemoveLinks: true,
                    dictCancelUploadConfirmation: "dictCancelUploadConfirmation",
                    dictRemoveFile: "ç§»é¤æä»¶",
                    init: function () {
                      this.on("success", function (file, data) {
                        //Ã¤Â¸ÂÃ¤Â¼Â Ã¦ÂÂÃ¥ÂÂÃ¨Â§Â¦Ã¥ÂÂÃ§ÂÂÃ¤ÂºÂÃ¤Â»Â¶
                        $scope.pics.push(data.src);
                        // $scope.pics.splice($.inArray(2, $scope.pics), 1);
                        $(".dz-remove").attr("pic", data.src);
                        console.log($scope.pics);
                        // angular.element(appElement).scope().file_id = data.data.id;
                      });
                      this.on("removedfile", function (file) {
                        var src = eval("(" + file.xhr.response + ")");
                        $scope.pics.splice($scope.pics.contains(src.src), 1);
                      });
                    }
                  });



          
                })
            }

          });
        });
      }
      $scope.addProducts = function () {
        $scope.currProducts = null;
        $scope.pqueryType = "insert";
        $scope.show(1080, 600, "添加商品", 'product/index.jsp');

      }
      $scope.alterProducts = function (o) {
        $scope.currProducts = o;
        $scope.pqueryType = "update";
        $scope.show(1080, 600, "编辑商品", 'product/index.jsp');
        
      }

      $scope.types;
      $scope.subTypes;
      $scope.allTypes;
      $scope.pics = [];
      $scope.getTypes = function (parentid) {
        $http({
          method: "post",
          url: "type/select?id=" + parentid,
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.types = data;
        });
      }
      Array.prototype.contains = function (obj) {
        var i = this.length;
        while (i--) {
          if (this[i] === obj) {
            return i; // Ã¨Â¿ÂÃ¥ÂÂÃ§ÂÂÃ¨Â¿ÂÃ¤Â¸Âª i Ã¥Â°Â±Ã¦ÂÂ¯Ã¥ÂÂÃ§Â´Â Ã§ÂÂÃ§Â´Â¢Ã¥Â¼ÂÃ¤Â¸ÂÃ¦Â ÂÃ¯Â¼Â
          }
        }
        return false;
      }
      $scope.allTypes = function () {
        
        $http({
          method: "post",
          url: "type/select",
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          $scope.allTypes = data;
        });
      }

      $(document).on("click", ".layui-layer .form-horizontal .btn-success ", function () {
        $(".layui-layer .form-horizontal .hide_pics").val($scope.pics);
        var jo = $(".layui-layer .form-horizontal").serializeObject();
        var data = JSON.stringify(jo);
        var ths = $(this);
        console.log(data);
        $http({
          method: "post",
          url: "product/" + $scope.pqueryType,
          data: data
        }).success(function (data) {
          if(data.state=="false"){
            window.location.href='login.html';
          }
          console.log(data);
          if (data.rs > 0) {
            ths.parents(".layui-layer-page").remove();
            // $scope.getOperators();
            $scope.getProducts();
          } else {
            alert("Ã¦ÂÂÃ¥ÂÂ¥Ã¥Â¤Â±Ã¨Â´Â¥");
          }
        });
      })
     
      $scope.showTypeWin = function (width, height, title, pid) {
        var content = "<div class=' row'>"
          + "   <label style='margin-top:10px;' class='control-label col-md-3 col-sm-3 col-xs-12' for='first-pType'>Ã§Â±Â»Ã¥ÂÂÃ¥ÂÂÃ§Â§Â°"
          + "   </label>"
          + "   <div class=' col-md-3 col-sm-3  ' style='margin-top: 5px;border-radius: 3px' >"
          + "       <input type='text' name='name'  class='input_pName'   value=''  id='first-pType' required='required'"
          + "       class='form-control col-md-7 col-xs-12'>"
          + "       <input type='hidden' value='" + pid + "' class='hide_pid' name='parentid'>"
          + "   </div>"
          + "</div>"
          + "<div class='row'><div class='col-md-6 col-sm-6 col-xs-12 col-md-offset-3'>"
          + "<button class='btn btn-success btnSub' >Ã¦ÂÂÃ¤ÂºÂ¤</button>"
          + "</div></div>"

        layui.use('layer', function () {
          var layer = layui.layer;
          layer.open({
            type: 1 //PageÃ¥Â±ÂÃ§Â±Â»Ã¥ÂÂ
            , area: [width + 'px', height + 'px']
            , title: title
            , shade: 0 //Ã©ÂÂ®Ã§Â½Â©Ã©ÂÂÃ¦ÂÂÃ¥ÂºÂ¦
            // ,offset: 't'
            , maxmin: true //Ã¥ÂÂÃ¨Â®Â¸Ã¥ÂÂ¨Ã¥Â±ÂÃ¦ÂÂÃ¥Â°ÂÃ¥ÂÂ
            , anim: -1 //0-6Ã§ÂÂÃ¥ÂÂ¨Ã§ÂÂ»Ã¥Â½Â¢Ã¥Â¼ÂÃ¯Â¼Â-1Ã¤Â¸ÂÃ¥Â¼ÂÃ¥ÂÂ¯
            , content: content
            , cancel: function (layero, index) {
              $(layero[0]).remove();
            }
            , success: function (layero, index) {
              // console.log(layero);

            }

          });
        });
      }
      $(document).on("mouseover", ".layui-layer .dropdown-menu", function () {
        // $(this).show();
        $(this).show();
      })
      $(document).on("mouseover  mouseleave", ".layui-layer .dropdown-menu span", function (event) {
        var li = $(this).children("li");

        // $(this).siblings().parent().find(".dropdown-menu").hide();
        if (event.type == "mouseover") {
          //Ã©Â¼Â Ã¦Â ÂÃ¦ÂÂ¬Ã¦ÂµÂ®
          $(this).siblings(".dropdown-menu").remove();
          var id = li.attr("id");
          $http({
            method: "post",
            url: "type/select?id=" + id,
          }).success(function (data) {
            if(data.state=="false"){
              window.location.href='login.html';
            }
            if (data.length == 0) return;
            var html = "<ul class='dropdown-menu sub_m show pull-left' style='position: absolute;top:0;left: 100%;' >";
            for (var i = 0; i < data.length; i++) {

              html = html + "<span> <li ng-click='clickType(subType)' id='" + data[i].id + "' >"
                + "<a class='col-md-7'>" + data[i].name + "</a>"
                + "</li><span class='glyphicon glyphicon-plus' style='line-height: 20px;' aria-hidden='true'></span></span>";
            }

            html = html + "</ul>";
            var linkFn = $compile(html);
            var element = linkFn($scope);
            li.parent().parent().append(element);
          });

        } else if (event.type == "mouseleave") {
          //Ã©Â¼Â Ã¦Â ÂÃ§Â¦Â»Ã¥Â¼Â
          $(this).parent().find(".dropdown-menu").hide();
        }
      })
      $(document).on("click", ".btnSub", function () {
        var name = $(".input_pName").val();
        var parentid = $(".hide_pid").val();
        var ths = $(this);
        var data = {
          "name": name,
          "parentid": parentid
        }
        $http({
          method: "post",
          url: "type/insert",
          data: JSON.stringify(data)
        }).success(function (data) {
          if(data.state=="false"){
              window.location.href='login.html';
            }
          if (data.rs > 0) {
            ths.parents(".layui-layer-page").remove();
            // $scope.getOperators();
            $scope.getTypes(0);
          } else {
            alert("Ã¦ÂÂÃ¥ÂÂ¥Ã¥Â¤Â±Ã¨Â´Â¥");
          }
        });

      })
      $(document).on("click", ".layui-layer .col-md-2 .dropdown-menu a", function (e) {
        e.preventDefault();
        $(".input_pType").val($(this).text());
        $(".hid_typeId").val($(this).parent().attr("id")); 

      })
      $(document).on("click", ".layui-layer .col-md-2 .glyphicon-plus", function (e) {
        e.preventDefault();
        var id = $(this).prev().attr("id");
        $scope.showTypeWin(350, 250, "Ã¦Â·Â»Ã¥ÂÂ Ã§Â±Â»Ã¥ÂÂ", id);
      })
      $scope.getProducts();
      $scope.getPStatus();
      $scope.getTypes(0);
      $scope.allTypes();
    }])
    jdShop.controller("shopcarIndexController", ["$scope", "$http", "$compile", function ($scope, $http, $compile) {
      $scope.shopcars;
      $scope.getShopcars = function(){
        $http({
          url:"shopcar/index",
          method:"POST",
        }).success(function(data){
          if(data.state=="false"){
              window.location.href='login.html';
            }
          $scope.shopcars = data.list;
          console.log(data);
        })
      }
      $scope.getShopcars();

    }])
  
    jdShop.controller("ordersIndexController", ["$scope", "$http", "$compile", function ($scope, $http, $compile) {
      $scope.orders;
      $scope.oStatuses
      $scope.getOStatus = function () {
        $http({
          method: "post",
          url: "orders/status"
        }).success(function (data) {
          if(data.state=="false"){
              window.location.href='login.html';
            }
          console.log(data);
          $scope.oStatuses = data;
        })
      }
      $scope.getOrders = function(){
        $http({
          url:"orders/select",
          method:"POST",
        }).success(function(data){
          if(data.state=="false"){
              window.location.href='login.html';
            }
          $scope.orders = data.list;
        })
      }
      $scope.search = function(){
        var formData = JSON.stringify($(".searchForm").serializeObject());
        $scope.currPage = 1;
        $(".pagination .active").removeClass("active");
        $(".pagination .previous").next().addClass("active");
        console.log(formData);
        $http({
          method: "post",
          data: formData,
          url: "orders/select"
        }).success(function (data) {
          if(data.state=="false"){
              window.location.href='login.html';
            }
          console.log(data);
          $scope.orders = data.list;
          $scope.allPage = data.allRows % 6 == 0 ? data.allRows / 6 : parseInt(data.allRows / 6) + 1;
          $(".input_where").val("");
        });
      }
      $scope.orderBtn = function(order){
        
        function copy(obj){
            var newobj = {};
            for ( var attr in obj) {
                newobj[attr] = obj[attr];
            }
            return newobj;
        }
        var o = copy(order);
        var osData ="";
        if(order.status==1){
          if(!confirm("确认发货？"))return;
          var info = prompt("输入运单号");
          var comment = prompt("输入快递公司");
          if(info=="" || comment==""){
            alert("信息不完整，请重新发货");
            return;
          }
          var os = {
            info:info,
            comments :comment
          }
          osData = JSON.stringify(os);
          o.status = 2;
        }else if(order.status==4){
          if(!confirm("确认退款"+o.nowamount +"元?"))return;
          var info = prompt("输入取消原因");
          if(info==""){
            alert("信息不完整，请重新发货");
            return;
          }
          var os = {
            info:info,
            amount :o.nowamount
          }
          osData = JSON.stringify(os);
          $("#myModalLabel").text("新增");
          $('#myModal').modal();
          o.status = 5;
        }
        var data = JSON.stringify(o);
        $http({
          method:"POST",
          url:"orders/delivery",
          data:{
            "data":data,
            "os":osData
          }
        }).success(function(data){
          if(data.state=="false"){
               window.location.href='login.html';
            }
          if(data.state == "ok"){
            order.status = data.code;
          }else{
            alert("失败");
          }
        })
      }
      $scope.getOrders();
      $scope.getOStatus();
    }])
  
  
    $(document).on("change", ".select_searchType", function () {
      var option = $(this).find("option").eq($(this).val()-1);
      var role = option.attr("c-role");
      console.log(role);
      if(typeof(role)=="undefined"){
        $(this).siblings().removeAttr("name");
        $(this).siblings().hide();
        $(this).next().attr("name", "where").show();
      }else{
        $(this).next().removeAttr("name").hide();
        $(this).siblings("."+role).attr("name", "where");
        $(this).siblings("."+role).removeClass("hidden");
        $(this).siblings("."+role).show();
      }
    
    })
  // </script>
  <!-- <%@include file="static/js/index_js.jsp" %> -->

</body>

</html>