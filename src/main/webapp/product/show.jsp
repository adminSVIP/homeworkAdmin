<%@page pageEncoding="utf-8" %>
<div class="col-md-12 col-sm-12 col-xs-12" style="min-height: 537px;">
        <div class="x_panel " style="min-height: 100%;">
            <div class="x_title">
                <h2>商品管理</h2>
                <form class="searchForm">
                    <ul class="nav navbar-right panel_toolbox">

                        <li style="margin-right: 20px;">

                            <select class="select_searchType" name="searchType">
                                <option value="1">姓名</option>
                                <option value="2">昵称</option>
                                <option value="3">状态</option>
                            </select>
                            <input type="text" class="input_where" name="where">
                            <select class="select_status hidden">
                                <option value={{$index+1}} ng-repeat="state in status track by $index">{{state}}</option>
                            </select>
                            <li class="text-info" ng-click="search()" style="margin-right: 20px;font-size: 20px;">
                                <i class="fa fa-search"></i>搜索
                            </li>

                        </li>
                        <li class="text-success" ng-click="addProducts()" style="font-size: 20px;">
                            <i class="fa fa-plus-circle"></i>添加
                        </li>

                    </ul>
                </form>
                <div class="clearfix"></div>
            </div>

            <div class="x_content" style="position: relative;min-height: 450px;">

                <!-- <p>Add class
                <code>bulk_action</code> to table for bulk actions options on row select</p> -->

                <div class="table-responsive" style="position: relative;">
                    <table class="table table-striped jambo_table bulk_action">
                        <thead>
                            <tr class="headings">

                                <th class="column-title">商品名称</th>
                                <th class="column-title">类型</th>
                                <th class="column-title">活动</th>
                                <th class="column-title">提示信息</th>
                                <th class="column-title">促销信息</th>
                                <!-- <th class="column-title">详情</th> -->
                                <th class="column-title">原价</th>
                                <th class="column-title">现价</th>
                                <th class="column-title">推荐等级</th>
                                <th class="column-title">状态</th>
                                <th class="column-title">销量</th>
                                <th class="column-title">收藏数</th>
                                <th class="column-title">备注</th>
                                <th class="column-title no-link last">
                                    <span class="nobr"></span>
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
                            <tr ng-repeat="product in products track by $index ">

                                <td class=" ">{{product.fullname }}</td>
                                <td class=" ">{{product.type_id }}</td>
                                <td class=" ">{{product.activity }}</td>
                                <td class=" ">{{product.tip}}</td>
                                <td class=" ">{{product.sale}}</td>
                                <!-- <td class=" ">{{product.info}}</td> -->
                                <td class=" ">{{product.price}}</td>
                                <td class=" ">{{product.nowprice}}</td>
                                <td class=" ">{{product.priority }}</td>
                                <td class=" ">{{product.status }}</td>
                                <td class=" ">{{product.salecount }}</td>
                                <td class=" ">{{product.collectcount }}</td>
                                <!-- <td class="a-right a-right " ng-if="$index+1 == operator.status" ng-repeat="state in status track by $index">
                                    {{state}}
                                </td> -->
                                <td class="a-right a-right ">{{product.comments}}</td>
                                <td class=" last">
                                    <span class="pointer text-success" ng-click="alterProducts(product)">
                                        <i class="fa fa-pencil "></i>编辑</span>
                                    <span style="margin-left: 20px;" class="pointer text-danger">
                                        <i class="fa fa-close"></i>删除</span>
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



            </div>
        </div>
</div>