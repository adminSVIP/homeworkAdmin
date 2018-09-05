<%@page pageEncoding="utf-8" %>
<style>
    .orderCode{
        cursor: pointer;
    }
    .orderCode:hover{
        color: orange;
    }
</style>
<div class="col-md-12 col-sm-12 col-xs-12" style="min-height: 537px;">
    <div class="x_panel " style="min-height: 100%;">
        <div class="x_title">
            <h2>订单管理</h2>
            <form class="searchForm">
                <ul class="nav navbar-right panel_toolbox">
                    <li style="margin-right: 20px; margin-left: 20px;">

                    </li>
                    <li style="margin-right: 20px; margin-left: 20px;">

                       <label>日期范围查询</label>
                       <input type="hidden" name="searchType" value="3">
                        <select class="dateRange " name="where">
                            <option value="1">一周内</option>
                            <option value="2">本月内</option>
                            <option value="3">30天内</option>
                            <option value="4">本年内</option>
                            <option value="5">上一年</option>
                        </select>

                        <li class="text-info" ng-click="search()" style="margin-right: 20px;font-size: 20px;">
                            <i class="fa fa-search"></i>搜索
                        </li>

                    </li>


                </ul>
            </form>
            <div class="clearfix"></div>
        </div>

        <div class="x_content" style="position: relative;min-height: 450px;">
            <div class="table-responsive" style="position: relative;">
                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                        <tr class="headings">

                            <th class="column-title">订单日期</th>
                            <th class="column-title">订单号</th>
                            <th class="column-title">原金额</th>
                            <th class="column-title">实际金额</th>
                            <th class="column-title">用户</th>
                            <th class="column-title">地址</th>
                            <th class="column-title">状态</th>
                            <th class="column-title">评价状态</th>
                            <th class="column-title">备注</th>

                            <th class="column-title no-link last">
                                <span class="nobr">操作</span>
                            </th>
                            <th class="bulk-actions" colspan="7">
                                <a class="antoo" style="color:#fff; font-weight:500;">
                                    <span class="action-cnt"> </span> )
                                    <i class="fa fa-chevron-down"></i>
                                </a>
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr ng-repeat="order in orders track by $index ">

                            <td class=" ">{{order.date}}</td>
                            <td class="orderCode" ng-click='showOrderDetails(order)'>
                                {{order.code}}
                            </td>
                            <td class=" ">{{order.amount}}</td>
                            <td class=" ">{{order.nowamount}}</td>
                            <td class=" ">{{order.address_id}}</td>
                            <td class=" ">{{order.user_id}}</td>
                            <td ng-if="$index==order.status" ng-repeat="state in  oStatuses track by $index" class=" ">{{state}}</td>
                            <td class=" ">{{order.assessstatus}}</td>
                            <td class=" ">{{order.comments}}</td>

                            <td class=" last">
                            	<span ng-if='order.status==3&&order.assessstatus==1'>已评价</span>
                            	<span ng-if='order.status==2'>已发货</span>
                				<span ng-if='order.status==5'>已退款</span>
                                <button ng-if="order.status==1" ng-click="orderBtn(order)" type="button" class="btn btn-info btn-xs">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">发货</font>
                                    </font>
                                </button>
                                <button ng-if="order.status==4" ng-click="orderBtn(order)" type="button" class="btn btn-info btn-xs">
                                    <font style="vertical-align: inherit;">
                                        <font style="vertical-align: inherit;">取消</font>
                                    </font>
                                </button>


                            </td>
                        </tr>
                    </tbody>
                </table>


            </div>
            <div class="dataTables_info" style="position: absolute;bottom: 25px;line-height: 35px;margin-left: 30px; width: 50%" id="datatable-buttons_info"
                role="status" aria-live="polite">
                第&nbsp;{{currPage}}&nbsp;页&nbsp;/&nbsp;{{allPage}}&nbsp;页
            </div>
            <div class="dataTables_paginate paging_simple_numbers pull-left " style="position: absolute; bottom: 0;margin-left: 200px;"
                id="datatable-buttons_paginate">
                <ul style="position: relative;" class="pagination" style="margin-bottom: 0;">
                    <!-- disabled -->
                    <li class="paginate_button previous " ng-click="prev()">
                        <a aria-controls="datatable-buttons" data-dt-idx="0" tabindex="0">上一页</a>
                    </li>
                    <li ng-click='pageBtn($event)' class="paginate_button active">
                        <a aria-controls="datatable-buttons" data-dt-idx="1" tabindex="0">1</a>
                    </li>
                    <li ng-click='pageBtn($event)' class="paginate_button" ng-if="allPage >= 2">
                        <a aria-controls="datatable-buttons" data-dt-idx="2" tabindex="0">2</a>
                    </li>
                    <li ng-click='pageBtn($event)' class="paginate_button " ng-if="allPage >= 3">
                        <a aria-controls="datatable-buttons" data-dt-idx="3" tabindex="0">3</a>
                    </li>
                    <!-- <li class="paginate_button ">
                                <a  aria-controls="datatable-buttons" data-dt-idx="4" tabindex="0">4</a>
                            </li>
                            <li class="paginate_button ">
                                <a  aria-controls="datatable-buttons" data-dt-idx="5" tabindex="0">5</a>
                            </li>
                            <li class="paginate_button ">
                                <a  aria-controls="datatable-buttons" data-dt-idx="6" tabindex="0">6</a>
                            </li> -->
                    <li class="paginate_button next" ng-click="next()">
                        <a aria-controls="datatable-buttons" data-dt-idx="7" tabindex="0">下一页</a>
                    </li>
                </ul>
            </div>
<!-- 首页    搜索框
        类别罗列,点击进入类别页
        商品罗列,图片,点击进入商品详情页
类别页
        商品罗列,图片,点击进入商品详情页
商品详情页
        数量修改,评价,加入购物车
购物车
        罗列
付款订单
        地址选择,金额,住房生成订单,删除购买内容
会员
        订单状态查询,状态修改 -->

        </div>
    </div>
</div>