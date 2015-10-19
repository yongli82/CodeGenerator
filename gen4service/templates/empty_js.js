define(function (require, exports, module) {
    var $ = require('./jquery');
    require("./jquery.tmpl");
    var ajax = require('./ajax');
    var list = require("./list");
    var option = require("./option");
    var loading = require("./loading");
    var dialog = require("./dialog");
    var pub = require("./public");
    require('bootstrap');
    require('./bootstrap-datepicker');
    
    $(document).ready(function () {
        pub.activeMenu("#visibility-menu");
        pub.bindAutoComplete();
        pub.menuCollapseHandler();
        pub.searchCollapseHandler();

        $('#search-btn').bind('click', function () {

        });

        pub.showTodoTaskNumber();
    });
});