<%@page pageEncoding="utf-8" %>
<div class="col-md-12 col-sm-12 col-xs-12" style="min-height: 537px;">
    <div class="x_panel " style="min-height: 100%;" >
        <div class="x_title">
            <h2>购物车</h2>
            <form class="searchForm">
            <ul class="nav navbar-right panel_toolbox">
                
                <li style="margin-right: 20px;">
                    <select class="select_searchType" name="searchType">
                        <option value="1">商品名称</option>
                        <option value="2">用户id</option>
                    </select>
                    <input type="text" class="input_where" name="where">
                    
                </li>

               
                <li class="text-info" ng-click="search()" style="margin-right: 20px;font-size: 20px;">
                    <i class="fa fa-search"></i>搜索
                </li>
                
               
            </ul>
            </form>
            <div class="clearfix"></div>
        </div>

        <div class="x_content" style="position: relative;min-height: 450px;">

            <!-- <p>Add class
                <code>bulk_action</code> to table for bulk actions options on row select</p> -->

            <div class="table-responsive" style="position: relative;" >
                <table class="table table-striped jambo_table bulk_action">
                    <thead>
                        <tr class="headings">
                            
                            <th class="column-title">用户id</th>
                            <th class="column-title">商品id</th>
                            <th class="column-title">商品名称</th>
                            <th class="column-title">商品图片</th>
                            <th class="column-title">数量</th>
                           
                            <!-- <th class="column-title no-link last">
                                <span class="nobr">操作</span>
                            </th> -->
                            <th class="bulk-actions" colspan="7">
                                <a class="antoo" style="color:#fff; font-weight:500;">
                                    <span class="action-cnt"> </span> )
                                    <i class="fa fa-chevron-down"></i>
                                </a>
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr ng-repeat="shopcar in shopcars track by $index " >
                            
                            <td class=" ">{{shopcar.user_id}}</td>
                            <td class=" ">{{shopcar.product_id}}</td>
                            <td class=" ">{{shopcar.fullname}}</td>
                            <td class=" ">
                                <img src="{{shopcar.pic}}" width="40px" height="40px" alt="">
                            </td>
                            <td class=" ">{{shopcar.count}}</td>
                            
                            <!-- <td class=" last">
                                <span class="pointer text-success" ng-click="alterOperator(operator)"><i class="fa fa-pencil "></i>编辑</span>
                                <span style="margin-left: 20px;" class="pointer text-danger"><i class="fa fa-close"></i>删除</span>
                            </td>  -->
                        </tr>
                    </tbody>
                </table>

                
            </div>
            <div class="dataTables_info" style="position: absolute;bottom: 25px;line-height: 35px;margin-left: 30px; width: 50%" id="datatable-buttons_info" role="status" aria-live="polite">
                第&nbsp;{{currPage}}&nbsp;页&nbsp;/&nbsp;{{allPage}}&nbsp;页
            </div>
            <div class="dataTables_paginate paging_simple_numbers pull-left " style="position: absolute; bottom: 0;margin-left: 200px;"  id="datatable-buttons_paginate">
                        <ul style="position: relative;" class="pagination" style="margin-bottom: 0;">
                                <!-- disabled -->
                            <li class="paginate_button previous " ng-click="prev()">
                                <a aria-controls="datatable-buttons" data-dt-idx="0" tabindex="0">上一页</a>
                            </li>
                            <li ng-click='pageBtn($event)' class="paginate_button active">
                                <a  aria-controls="datatable-buttons" data-dt-idx="1" tabindex="0">1</a>
                            </li>
                            <li ng-click='pageBtn($event)' class="paginate_button" ng-if="allPage >= 2">
                                <a  aria-controls="datatable-buttons" data-dt-idx="2" tabindex="0">2</a>
                            </li>
                            <li ng-click='pageBtn($event)' class="paginate_button " ng-if="allPage >= 3">
                                <a  aria-controls="datatable-buttons" data-dt-idx="3" tabindex="0">3</a>
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
                            <li class="paginate_button next" ng-click="next()" >
                                <a  aria-controls="datatable-buttons" data-dt-idx="7" tabindex="0">下一页</a>
                            </li>
                        </ul>
            </div>
            


        </div>
    </div>
</div>


