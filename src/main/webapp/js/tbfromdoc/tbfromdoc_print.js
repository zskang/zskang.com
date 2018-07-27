/**
 * Created by 顾什么 on 2017.7.3.
 */
var uuid = T.p("uuid");

var vm = new Vue({
    el:'#rrapp',
    data:{
        title:"打印",
        filetypeList:{},
        tbFromDoc: {
            years:"",
            writtendate:"",
            regisdate:"",
            receiveddate:"",
            filesequence:"",
            fromdepartment:"",
            subjectword:"",
            transactnumber:"",
            storageperiod:"",
            finishdate:"",
            iffile:"",
            filetypeArr:[]
        }
    },
    created: function () {
        this.getInfo(uuid);
    },
    methods: {
        getInfo: function (uuid) {
            $.get("../tbfromdoc/info/" + uuid, function (r) {
                vm.tbFromDoc = r.tbFromDoc;
                var date=new Date;
                var year=date.getFullYear();
                var currentYear=year;
                document.getElementById("currentYear").innerHTML=currentYear+"年";
                document.getElementById("receiveddate").innerHTML=vm.tbFromDoc.receiveddate;
                document.getElementById("filesequence").innerHTML=vm.tbFromDoc.filesequence;
                document.getElementById("fromdepartment").innerHTML=vm.tbFromDoc.fromdepartment;
                document.getElementById("subjectword").innerHTML=vm.tbFromDoc.subjectword;
                document.getElementById("transactnumber").innerHTML=vm.tbFromDoc.transactnumber;
                document.getElementById("storageperiod").innerHTML=vm.tbFromDoc.storageperiod;
            });
        },
        print: function (event) {
            bdhtml=window.document.body.innerHTML;
            // sprnstr="<!--startprint-->"; //开始打印标识字符串有17个字符
            // eprnstr="<!--endprint-->"; //结束打印标识字符串
            // prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); //从开始打印标识之后的内容
            // prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
            // window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
            // window.print(); //调用浏览器的打印功能打印指定区域
            // window.document.body.innerHTML=bdhtml; // 最后还原页面
            window.document.body.innerHTML=document.getElementById("printcontent").innerHTML;
            window.print();
            window.document.body.innerHTML=bdhtml;
            window.location.reload();
        },
        back: function (event) {
            history.go(-1);
        }
    }
});