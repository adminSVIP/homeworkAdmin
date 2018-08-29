<%@page pageEncoding="utf-8" %>
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
          });
}]);


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
      console.log(data);
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
        console.log(data);
        if (data.rs > 0) {
          $(".layui-layer-page").remove();
          $scope.getOperators();
        } else {
          alert("æå¥å¤±è´¥");
        }
      },
      error: function (data) {
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
      $scope.operators = data.list;
      $scope.allPage = data.allRows % 6 == 0 ? data.allRows / 6 : parseInt(data.allRows / 6) + 1;
      $(".input_where").val("");
    });
  }
  $scope.next = function () {
    if (($scope.currPage + 1) <= $scope.allPage) {
      var active = $(".pagination .active");
      $scope.currPage = $scope.currPage + 1;
      $scope.getOperators($scope.currPage);
      var nextBtn = $(".pagination .next");
      var cmaxPage = nextBtn.prev().find("a").html();
      if (cmaxPage < $scope.allPage) {
        $(".pagination li a").each(function () {
          var content = $(this).html();
          if (content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ" || content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return true;
          $(this).html(parseInt($(this).html()) + 1);
        })
      }
      if (active.next().find("a").html() == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return;
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
          if (content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ" || content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return true;
          $(this).html(parseInt($(this).html()) - 1);
        })
      }
      if (active.prev().find("a").html() == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return;
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
        if (content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ" || content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return true;
        $(this).html(parseInt($(this).html()) - 2);
      })
    }
    var nextBtn = $(".pagination .next");
    var cmaxPage = nextBtn.prev().find("a").html();
    if (cmaxPage < ($scope.allPage - 1)) {
      console.log("+2");
      $(".pagination li a").each(function () {
        var content = $(this).html();
        if (content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ" || content == "Ã¤Â¸ÂÃ¤Â¸ÂÃ©Â¡Âµ") return true;
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
      console.log(data);
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
      // $scope.operators = data.list;
      console.log(data);
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



              // if($scope.currOperator != null){
              //   $(".input_status option").each(function(){
              // 	 if($(this).val() == $scope.currOperator.status){
              // 		 $(this).prop("selected","selected")
              // 	 }
              //   });
              //   $(".input_power option").each(function(){
              // 	 if($(this).val() == $scope.currOperator.power){
              // 		 $(this).prop("selected","selected")
              // 	 }
              //   });
              //   $("#gender input[name='sex']").each(function(){
              // 	 if($(this).val() == $scope.currOperator.sex){
              // 		 $(this).prop("selected","selected");
              // 		 $(this).parent().addClass("active");
              // 	 }
              //   });

              // }
            })
        }

      });
    });
  }
  $scope.addProducts = function () {
    $scope.currProducts = null;
    $scope.pqueryType = "insert";
    $scope.show(1080, 600, "Ã¦Â·Â»Ã¥ÂÂ Ã¥ÂÂÃ¥ÂÂ", 'product/index.jsp');

  }
  $scope.alterProducts = function (o) {
    $scope.currProducts = o;
    $scope.pqueryType = "update";
    $scope.show(1080, 600, "Ã§Â¼ÂÃ¨Â¾ÂÃ¥ÂÂÃ¥ÂÂ", 'product/index.jsp');
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
      console.log(data);
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
  // $scope.confrim = function(){
  //   console.log(12);
  //   $(".right_col .form-horizontal .hide_pics").val($scope.pics);
  //   var jo = $(".right_col .form-horizontal").serializeObject();
  //   var data = JSON.stringify(jo);
  //   console.log(data);
  //   $http({
  //     method: "post",
  //     url: "product/insert",
  //     data:data
  //   }).success(function (data) {
  //     console.log(data);
  //     // if(data.rs>0){
  //     //   $(".layui-layer-page").remove();
  //     //   // $scope.getOperators();
  //     //   $scope.getTypes(0);
  //     // }else{
  //     //   alert("Ã¦ÂÂÃ¥ÂÂ¥Ã¥Â¤Â±Ã¨Â´Â¥");
  //     // }
  //   });
  // }
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
    console.log()
    $scope.showTypeWin(350, 250, "Ã¦Â·Â»Ã¥ÂÂ Ã§Â±Â»Ã¥ÂÂ", id);
  })
  $scope.getProducts();
  $scope.getPStatus();
  $scope.getTypes(0);
  $scope.allTypes();
}])

$(document).on("change", ".select_searchType", function () {
  if ($(this).val() == 3) {
    $(this).next().removeAttr("name").hide();
    $(this).siblings(".select_status").attr("name", "where");
    $(this).siblings(".select_status").removeClass("hidden");
  } else {
    $(this).next().attr("name", "where").show();
    $(this).siblings(".select_status").removeAttr("name");
    $(this).next().attr("name", "where");
    $(this).siblings(".select_status").addClass("hidden");
  }
})