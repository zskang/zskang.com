var id = T.p("id");
var vm = new Vue({
    el: '#rrapp',
    data: {
        title: "查看",
        content: "",
        tbText: {}
    },
    created: function () {
        if (id != null) {
            this.title = "查看";
            $.get("../tbtext/info/" + id, function (r) {
                document.getElementById('titltle').innerHTML = r.tbText.title;
                document.getElementById('typ').innerHTML = r.tbText.type;
                document.getElementById('fbr').innerHTML = r.tbText.userid;
                document.getElementById('fbsj').innerHTML = r.tbText.createtime;
                document.getElementById('content').innerHTML = r.tbText.content;
              //  document.getElementById('image').innerHTML = "<a href='http://220.180.110.108:8080/static_res/jyjuploadfiles/" + r.tbText.image + " target=\"_blank\">http://220.180.110.108:8080/static_res/jyjuploadfiles/" + r.tbText.image + "</a>";
            });
        }
    },
    methods: {
        back: function (event) {
            history.go(-1);
        }
    }
});