/**
 * Created by zskang on 2017/7/22.
 */
var userIds = T.p("userIds");
$(function () {
    $("#userIds").val(userIds);
});

var vm = new Vue({
    el: '#rrapp',
    data: {},
    methods: {
        sendingNow: function (event) {
            var userIds = $("#userIds").val();
            var msg = $.trim($("#msg").val());
            if (msg == "" || msg == null) {
                alert("请输入发送的短信内容！");
                return false;
            }
            var params = msg + "_" + userIds;
            $.ajax({
                type: "POST",
                url: "../sys/user/sendMsgs",
                data: JSON.stringify(params),
                success: function (r) {
                    if (r.code == 0) {
                        alert('短信发送成功！');
                    } else {
                        alert(r.msg);
                    }
                }
            });
        },
        sendingAfter: function (event) {
            var userIds = $("#userIds").val();
            var senddate = $("#senddate").val();
            var msg = $("#msg").val();
            var params = msg + "_" + userIds + "_2";
            $.ajax({
                type: "POST",
                url: "../sys/user/sendMsgs",
                data: JSON.stringify(params),
                success: function (r) {
                    if (r.code == 0) {
                        alert('短信发送成功！');
                    } else {
                        alert(r.msg);
                    }
                }
            });
        }
    }
});