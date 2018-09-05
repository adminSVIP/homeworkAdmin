<%@page pageEncoding="utf-8" %>
<div class="table-responsive" style="position: relative;">
        <table class="table table-striped jambo_table bulk_action">
            <thead>
                <tr class="headings">
     
                    <th class="column-title">订单号</th>
                    <th class="column-title">日期</th>
                    <th class="column-title">商品名称</th>
                    <th class="column-title">价格</th>
                    <th class="column-title">数量</th>
                    <th class="column-title">金额</th>
                    <th class="column-title">快递单号</th>
                    <th class="column-title">快递公司</th>
                    <th class="column-title">订单状态</th>
                    <th class="column-title">收货地址</th>
                    
                    <th class="bulk-actions" colspan="7">
                        <a class="antoo" style="color:#fff; font-weight:500;">
                            <span class="action-cnt"> </span> )
                            <i class="fa fa-chevron-down"></i>
                        </a>
                    </th>
                </tr>
            </thead>
    
            <tbody>
                <tr ng-repeat="detail in orderDetails track by $index ">
    
                    <td class=" ">{{detail.code}}</td>
                    <td class=" ">{{detail.date}}</td>
                    <td class=" ">{{detail.fullname}}</td>
                    <td class=" ">{{detail.price}}</td>
                    <td class=" ">{{detail.count}}</td>
                    <td class=" ">{{detail.amount}}</td>
                    <td class=" ">{{detail.info}}</td>
                    <td class=" ">{{detail.comments}}</td>
                    <td ng-repeat='state in oStatuses track by $index' ng-if='detail.status==$index' class=" ">
                       {{state}}
                    </td>
                    <td class=" ">{{detail.zone}}/{{detail.addr}}</td>
                    
                </tr>
            </tbody>
        </table>
    
    
    </div>
    <!-- //网络
     //操作系统
     //数据结构
     //数据库
     //jvm,线程间通讯 -->