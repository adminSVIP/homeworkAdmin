<!-- <%@ page language="java"   pageEncoding="utf-8"%> -->
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel ">
                <div class="x_title">
                    <h2>商品管理</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="col-md-2 pull-left">  
                        <div class="row" style="margin-top: 20px">
                            <div class="col-md-12">选择商品类型</div>
                        </div>
                        <div class="row dropdown">
                            <button class="btn btn-default dropdown-toggle col-md-7" id='0' type="button" id="dropdownMenu1" data-toggle="dropdown">
                                <span>商品类型</span> 
                                <span class="caret"></span>
                                
                            </button>
                            <span class="glyphicon glyphicon-plus" style="line-height: 30px;" aria-hidden="true"></span> 
                            <ul class="dropdown-menu pull-left" style="position: relative;top: 0;" aria-labelledby="dropdownMenu1">
                                <span class="col-md-12 " style="padding: 0" ng-repeat="type in types">
                                    <li  id={{type.id}} ng-click="clickType(type)"><a class="col-md-7">{{type.name}}</a></li><span class="glyphicon glyphicon-plus" style="line-height: 20px;" aria-hidden="true"></span>
                                </span>
                              
                            </ul>
                        </div> 
                        
                    </div>
                    <!-- ueditor -->
                    
                    <span class="dr"></span>
                    <form  class="form-horizontal form-label-left  pull-left col-md-6 " >
                            
                        <input type='hidden' name='id' value="{{currProducts.id}}" />
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-pType">商品类型
                                <span class="required">*</span>
                            </label>
                            <div class=" col-md-3 col-sm-3  " style="margin-top: 5px;border-radius: 3px" >
                                <span ng-repeat=" t in allTypes">

                                    <input  ng-if="t.id==currProducts.type_id"  type="text"  class="input_pType" readonly  value="{{t.name}}"  id="first-pType" required="required"
                                    class="form-control col-md-7 col-xs-12">
                                    <input ng-if="t.id==currProducts.type_id" type="hidden" class="hid_typeId" value="{{currProducts.type_id}}" name="type_id">
                                </span>
                               
                                <span ng-if="pqueryType=='insert'">
                                    <input   type="text"  class="input_pType" readonly  value=""  id="first-pType" required="required"
                                    class="form-control col-md-7 col-xs-12">
                                    <input ng-if="t.id==currProducts.type_id" type="hidden" class="hid_typeId" value="{{currProducts.type_id}}" name="type_id">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-fullname">商品名称
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="input_fullname" value="{{currProducts.fullname}}" name="fullname" id="first-fullname" required="required"
                                    class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="priority">推荐等级
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="priority" type="text" class="input_priority" name="priority" value="{{currProducts.priority}}" required="required"
                                    class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">状态
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <select class="form-control input_power " name='status'>
                                    <!-- <span ng-if="pqueryType=='insert'">
                                        <option ng-repeat="status in pStatuses track by $index" >{{status}}</option>
                                    </span> -->
                                    <option ng-repeat="p in pStatuses track by $index" ng-if="$index+1==currProducts.status"  value="{{$index+1}}" >{{p}}</option>
                                    <option ng-repeat="p in pStatuses track by $index" ng-if="$index+1!=currProducts.status"  value="{{$index+1}}" >{{p}}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="input_activity">活动
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="input_activity" class="input_activity" name="activity" value="{{currProducts.activity}}" required="required"
                                    class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group" >
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="input_tip">提示信息
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="input_tip" class="input_tip" name="tip" value="{{currProducts.tip}}" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="input_sale">促销信息
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="input_sale" class="input_sale" name="sale" value="{{currProducts.sale}}" required="required" class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="input_price">原价
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" id="input_price" class="input_price" name="price" value="{{currProducts.price}}" required="required"
                                    class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="nowprice">现价
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input id="nowprice" type="text" class="input_nowprice" name="nowprice" value="{{currProducts.nowprice}}" required="required"
                                    class="form-control col-md-7 col-xs-12">
                            </div>
                        </div>
                        <input type="hidden" class="hide_pics" name="pics" value="{{currProducts.pics}}" >
                        <input type="hidden" class="edit_info" value="{{currProducts.info}}">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="input_info">详情
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="max-height:400px;overflow:hidden">
                                <!-- <input type="text" id="input_info" class="input_info" name="info" value="{{currProducts.info}}" required="required" class="form-control col-md-7 col-xs-12"> -->
                                <span>
                                    <script id='editor' type='text/plain' style='width:100%;height:100%;'></script>
                                    <script>
                                        // var ue = UE.getEditor('editor');

                                        // ue.ready(function() {
                                            //设置编辑器的内容
                                            // ue.setContent($(".edit_info").val());
                                            //获取html内容，返回: <p>hello</p>
                                            // var html = ue.getContent();
                                            //获取纯文本内容，返回: hello
                                            // var txt = ue.getContentTxt();
                                        // });
                                        UE.delEditor('editor');
                                        var ue = UE.getEditor("editor");
                                        ue.ready(function() {
                                            // 设置编辑器的内容
                                            ue.setContent($(".edit_info").val());
                                            // 获取html内容，返回: <p>hello</p>
                                            // var html = ue.getContent();
                                            // 获取纯文本内容，返回: hello
                                            // var txt = ue.getContentTxt();
                                        });
                                                                                
                                    </script>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <div class="btn btn-success " >提交</div>
                            </div>
                        </div>

                    </form>
                    
                    <div class="ln_solid" style="clear: both"></div>
                </div>
            </div>
        </div>
    </div>